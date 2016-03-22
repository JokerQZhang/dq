package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzHjmdManager;
import com.joker.dq.model.TzHjmd;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzHjmdActionTest extends BaseActionTestCase {
    private TzHjmdAction action;

    @Autowired
    private TzHjmdManager tzHjmdManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzHjmdAction();
        action.setTzHjmdManager(tzHjmdManager);

        // add a test tzHjmd to the database
        TzHjmd tzHjmd = new TzHjmd();

        // enter all required fields

        tzHjmdManager.save(tzHjmd);
    }

    @Test
    public void testGetAllTzHjmds() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzHjmds().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzHjmdManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzHjmds().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setHjmdId(-1L);
        assertNull(action.getTzHjmd());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzHjmd());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setHjmdId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzHjmd());

        TzHjmd tzHjmd = action.getTzHjmd();
        // update required fields

        action.setTzHjmd(tzHjmd);

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
        TzHjmd tzHjmd = new TzHjmd();
        tzHjmd.setHjmdId(-2L);
        action.setTzHjmd(tzHjmd);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
