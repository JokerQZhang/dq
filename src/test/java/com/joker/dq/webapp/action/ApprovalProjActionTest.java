package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.ApprovalProjManager;
import com.joker.dq.model.ApprovalProj;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class ApprovalProjActionTest extends BaseActionTestCase {
    private ApprovalProjAction action;

    @Autowired
    private ApprovalProjManager approvalProjManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new ApprovalProjAction();
        action.setApprovalProjManager(approvalProjManager);

        // add a test approvalProj to the database
        ApprovalProj approvalProj = new ApprovalProj();

        // enter all required fields

        approvalProjManager.save(approvalProj);
    }

    @Test
    public void testGetAllApprovalProjs() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getApprovalProjs().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        approvalProjManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getApprovalProjs().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setApprovalProjId(-1L);
        assertNull(action.getApprovalProj());
        assertEquals("success", action.edit());
        assertNotNull(action.getApprovalProj());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setApprovalProjId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getApprovalProj());

        ApprovalProj approvalProj = action.getApprovalProj();
        // update required fields

        action.setApprovalProj(approvalProj);

        assertEquals("input", action.save());
        assertFalse(action.hasActionErrors());
        assertFalse(action.hasFieldErrors());
        assertNotNull(request.getSession().getAttribute("messages"));
    }

    @Test
    public void testRemove() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setDelete("");
        ApprovalProj approvalProj = new ApprovalProj();
        approvalProj.setApprovalProjId(-2L);
        action.setApprovalProj(approvalProj);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
