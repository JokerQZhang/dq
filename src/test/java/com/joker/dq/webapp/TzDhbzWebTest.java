package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TzDhbzWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTzDhbz() {
        beginAt("/editTzDhbz");
        assertTitleKeyMatches("tzDhbzDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tzDhbzList.title");
        assertKeyPresent("tzDhbz.added");
    }

    @Test
    public void listTzDhbzs() {
        beginAt("/tzDhbzs");
        assertTitleKeyMatches("tzDhbzList.title");

        // check that table is present
        assertTablePresent("tzDhbzList");
    }

    @Test
    public void editTzDhbz() {
        beginAt("/editTzDhbz?dhbzId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tzDhbzDetail.title");
    }

    @Test
    public void saveTzDhbz() {
        beginAt("/editTzDhbz?id=" + getInsertedId());
        assertTitleKeyMatches("tzDhbzDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tzDhbzDetail.title");
        assertKeyPresent("tzDhbz.updated");
    }

    @After
    public void removeTzDhbz() {
        beginAt("/editTzDhbz?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tzDhbzList.title");
        assertKeyPresent("tzDhbz.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tzDhbzs");
        assertTablePresent("tzDhbzList");
        Table table = getTable("tzDhbzList");
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
