package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TzDyzthWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTzDyzth() {
        beginAt("/editTzDyzth");
        assertTitleKeyMatches("tzDyzthDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tzDyzthList.title");
        assertKeyPresent("tzDyzth.added");
    }

    @Test
    public void listTzDyzths() {
        beginAt("/tzDyzths");
        assertTitleKeyMatches("tzDyzthList.title");

        // check that table is present
        assertTablePresent("tzDyzthList");
    }

    @Test
    public void editTzDyzth() {
        beginAt("/editTzDyzth?dyzthId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tzDyzthDetail.title");
    }

    @Test
    public void saveTzDyzth() {
        beginAt("/editTzDyzth?id=" + getInsertedId());
        assertTitleKeyMatches("tzDyzthDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tzDyzthDetail.title");
        assertKeyPresent("tzDyzth.updated");
    }

    @After
    public void removeTzDyzth() {
        beginAt("/editTzDyzth?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tzDyzthList.title");
        assertKeyPresent("tzDyzth.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tzDyzths");
        assertTablePresent("tzDyzthList");
        Table table = getTable("tzDyzthList");
        // Find link in last row, skip header row
        for (int i = 1; i < table.getRows().size(); i++) {
            Row row = table.getRows().get(i);
            if (i == table.getRowCount() - 1) {
                return row.getCells().get(0).getValue();
            }
        }
        return "";
    }

    private void assertTitleKeyMatches(String title) {
        assertTitleEquals(messages.getString(title) + " | " + messages.getString("webapp.name"));
    }
}
