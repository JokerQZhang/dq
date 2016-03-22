package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzDyzthManager;
import com.joker.dq.model.TzDyzth;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzDyzthActionTest extends BaseActionTestCase {
    private TzDyzthAction action;

    @Autowired
    private TzDyzthManager tzDyzthManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzDyzthAction();
        action.setTzDyzthManager(tzDyzthManager);

        // add a test tzDyzth to the database
        TzDyzth tzDyzth = new TzDyzth();

        // enter all required fields

        tzDyzthManager.save(tzDyzth);
    }

    @Test
    public void testGetAllTzDyzths() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzDyzths().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzDyzthManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzDyzths().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setDyzthId(-1L);
        assertNull(action.getTzDyzth());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzDyzth());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setDyzthId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzDyzth());

        TzDyzth tzDyzth = action.getTzDyzth();
        // update required fields

        action.setTzDyzth(tzDyzth);

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
        TzDyzth tzDyzth = new TzDyzth();
        tzDyzth.setDyzthId(-2L);
        action.setTzDyzth(tzDyzth);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
