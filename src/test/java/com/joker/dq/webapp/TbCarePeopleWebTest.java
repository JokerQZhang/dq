package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class TbCarePeopleWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addTbCarePeople() {
        beginAt("/editTbCarePeople");
        assertTitleKeyMatches("tbCarePeopleDetail.title");
        clickButton("save");
        assertTitleKeyMatches("tbCarePeopleList.title");
        assertKeyPresent("tbCarePeople.added");
    }

    @Test
    public void listTbCarePeoples() {
        beginAt("/tbCarePeoples");
        assertTitleKeyMatches("tbCarePeopleList.title");

        // check that table is present
        assertTablePresent("tbCarePeopleList");
    }

    @Test
    public void editTbCarePeople() {
        beginAt("/editTbCarePeople?peopleId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("tbCarePeopleDetail.title");
    }

    @Test
    public void saveTbCarePeople() {
        beginAt("/editTbCarePeople?id=" + getInsertedId());
        assertTitleKeyMatches("tbCarePeopleDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("tbCarePeopleDetail.title");
        assertKeyPresent("tbCarePeople.updated");
    }

    @After
    public void removeTbCarePeople() {
        beginAt("/editTbCarePeople?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("tbCarePeopleList.title");
        assertKeyPresent("tbCarePeople.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/tbCarePeoples");
        assertTablePresent("tbCarePeopleList");
        Table table = getTable("tbCarePeopleList");
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
