package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TzFwqzWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTzFwqz() {
        beginAt("/editTzFwqz");
        assertTitleKeyMatches("tzFwqzDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tzFwqzList.title");
        assertKeyPresent("tzFwqz.added");
    }

    @Test
    public void listTzFwqzs() {
        beginAt("/tzFwqzs");
        assertTitleKeyMatches("tzFwqzList.title");

        // check that table is present
        assertTablePresent("tzFwqzList");
    }

    @Test
    public void editTzFwqz() {
        beginAt("/editTzFwqz?fwqzId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tzFwqzDetail.title");
    }

    @Test
    public void saveTzFwqz() {
        beginAt("/editTzFwqz?id=" + getInsertedId());
        assertTitleKeyMatches("tzFwqzDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tzFwqzDetail.title");
        assertKeyPresent("tzFwqz.updated");
    }

    @After
    public void removeTzFwqz() {
        beginAt("/editTzFwqz?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tzFwqzList.title");
        assertKeyPresent("tzFwqz.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tzFwqzs");
        assertTablePresent("tzFwqzList");
        Table table = getTable("tzFwqzList");
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
