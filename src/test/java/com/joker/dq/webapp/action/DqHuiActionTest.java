package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.DqHuiManager;
import com.joker.dq.model.DqHui;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class DqHuiActionTest extends BaseActionTestCase {
    private DqHuiAction action;

    @Autowired
    private DqHuiManager dqHuiManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new DqHuiAction();
        action.setDqHuiManager(dqHuiManager);

        // add a test dqHui to the database
        DqHui dqHui = new DqHui();

        // enter all required fields

        dqHuiManager.save(dqHui);
    }

    @Test
    public void testGetAllDqHuies() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getDqHuies().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        dqHuiManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getDqHuies().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setHuiId(-1L);
        assertNull(action.getDqHui());
        assertEquals("success", action.edit());
        assertNotNull(action.getDqHui());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setHuiId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getDqHui());

        DqHui dqHui = action.getDqHui();
        // update required fields

        action.setDqHui(dqHui);

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
        DqHui dqHui = new DqHui();
        dqHui.setHuiId(-2L);
        action.setDqHui(dqHui);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
