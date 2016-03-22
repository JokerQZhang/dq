package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzZtjjManager;
import com.joker.dq.model.TzZtjj;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzZtjjActionTest extends BaseActionTestCase {
    private TzZtjjAction action;

    @Autowired
    private TzZtjjManager tzZtjjManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzZtjjAction();
        action.setTzZtjjManager(tzZtjjManager);

        // add a test tzZtjj to the database
        TzZtjj tzZtjj = new TzZtjj();

        // enter all required fields

        tzZtjjManager.save(tzZtjj);
    }

    @Test
    public void testGetAllTzZtjjs() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzZtjjs().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzZtjjManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzZtjjs().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setZtjjId(-1L);
        assertNull(action.getTzZtjj());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzZtjj());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setZtjjId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzZtjj());

        TzZtjj tzZtjj = action.getTzZtjj();
        // update required fields

        action.setTzZtjj(tzZtjj);

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
        TzZtjj tzZtjj = new TzZtjj();
        tzZtjj.setZtjjId(-2L);
        action.setTzZtjj(tzZtjj);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
