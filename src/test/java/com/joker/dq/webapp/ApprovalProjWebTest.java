package com.joker.dq.webapp;

import net.sourceforge.jwebunit.html.Row;
import net.sourceforge.jwebunit.html.Table;
import org.junit.After;
import org.junit.Before;
import org.junit.Test;

import java.util.ResourceBundle;

import static net.sourceforge.jwebunit.junit.JWebUnit.*;

public class ApprovalProjWebTest {

    private ResourceBundle messages;

    @Before
    public void setUp() {
        setScriptingEnabled(false);
        getTestContext().setBaseUrl("http://" + System.getProperty("cargo.host") + ":" + System.getProperty("cargo.port"));
        getTestContext().setResourceBundleName("messages");
        messages = ResourceBundle.getBundle("messages");
    }

    @Before
    public void addApprovalProj() {
        beginAt("/editApprovalProj");
        assertTitleKeyMatches("approvalProjDetail.title");
        clickButton("save");
        assertTitleKeyMatches("approvalProjList.title");
        assertKeyPresent("approvalProj.added");
    }

    @Test
    public void listApprovalProjs() {
        beginAt("/approvalProjs");
        assertTitleKeyMatches("approvalProjList.title");

        // check that table is present
        assertTablePresent("approvalProjList");
    }

    @Test
    public void editApprovalProj() {
        beginAt("/editApprovalProj?approvalProjId=" + getInsertedId());
        clickButton("save");
        assertTitleKeyMatches("approvalProjDetail.title");
    }

    @Test
    public void saveApprovalProj() {
        beginAt("/editApprovalProj?id=" + getInsertedId());
        assertTitleKeyMatches("approvalProjDetail.title");

        // update some of the required fields
        clickButton("save");
        assertTitleKeyMatches("approvalProjDetail.title");
        assertKeyPresent("approvalProj.updated");
    }

    @After
    public void removeApprovalProj() {
        beginAt("/editApprovalProj?id=" + getInsertedId());
        clickButton("delete");
        assertTitleKeyMatches("approvalProjList.title");
        assertKeyPresent("approvalProj.deleted");
    }

    /**
     * Convenience method to get the id of the inserted record
     *
     * @return last id in the table
     */
    protected String getInsertedId() {
        beginAt("/approvalProjs");
        assertTablePresent("approvalProjList");
        Table table = getTable("approvalProjList");
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
