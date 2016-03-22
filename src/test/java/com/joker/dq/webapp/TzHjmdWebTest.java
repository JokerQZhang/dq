package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TzHjmdWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTzHjmd() {
        beginAt("/editTzHjmd");
        assertTitleKeyMatches("tzHjmdDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tzHjmdList.title");
        assertKeyPresent("tzHjmd.added");
    }

    @Test
    public void listTzHjmds() {
        beginAt("/tzHjmds");
        assertTitleKeyMatches("tzHjmdList.title");

        // check that table is present
        assertTablePresent("tzHjmdList");
    }

    @Test
    public void editTzHjmd() {
        beginAt("/editTzHjmd?hjmdId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tzHjmdDetail.title");
    }

    @Test
    public void saveTzHjmd() {
        beginAt("/editTzHjmd?id=" + getInsertedId());
        assertTitleKeyMatches("tzHjmdDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tzHjmdDetail.title");
        assertKeyPresent("tzHjmd.updated");
    }

    @After
    public void removeTzHjmd() {
        beginAt("/editTzHjmd?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tzHjmdList.title");
        assertKeyPresent("tzHjmd.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tzHjmds");
        assertTablePresent("tzHjmdList");
        Table table = getTable("tzHjmdList");
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
