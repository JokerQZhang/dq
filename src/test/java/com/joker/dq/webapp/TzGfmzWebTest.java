package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TzGfmzWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTzGfmz() {
        beginAt("/editTzGfmz");
        assertTitleKeyMatches("tzGfmzDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tzGfmzList.title");
        assertKeyPresent("tzGfmz.added");
    }

    @Test
    public void listTzGfmzs() {
        beginAt("/tzGfmzs");
        assertTitleKeyMatches("tzGfmzList.title");

        // check that table is present
        assertTablePresent("tzGfmzList");
    }

    @Test
    public void editTzGfmz() {
        beginAt("/editTzGfmz?gfmzId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tzGfmzDetail.title");
    }

    @Test
    public void saveTzGfmz() {
        beginAt("/editTzGfmz?id=" + getInsertedId());
        assertTitleKeyMatches("tzGfmzDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tzGfmzDetail.title");
        assertKeyPresent("tzGfmz.updated");
    }

    @After
    public void removeTzGfmz() {
        beginAt("/editTzGfmz?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tzGfmzList.title");
        assertKeyPresent("tzGfmz.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tzGfmzs");
        assertTablePresent("tzGfmzList");
        Table table = getTable("tzGfmzList");
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
