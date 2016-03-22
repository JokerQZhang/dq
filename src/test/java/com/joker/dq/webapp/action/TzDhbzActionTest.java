package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzDhbzManager;
import com.joker.dq.model.TzDhbz;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzDhbzActionTest extends BaseActionTestCase {
    private TzDhbzAction action;

    @Autowired
    private TzDhbzManager tzDhbzManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzDhbzAction();
        action.setTzDhbzManager(tzDhbzManager);

        // add a test tzDhbz to the database
        TzDhbz tzDhbz = new TzDhbz();

        // enter all required fields

        tzDhbzManager.save(tzDhbz);
    }

    @Test
    public void testGetAllTzDhbzs() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzDhbzs().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzDhbzManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzDhbzs().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setDhbzId(-1L);
        assertNull(action.getTzDhbz());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzDhbz());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setDhbzId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzDhbz());

        TzDhbz tzDhbz = action.getTzDhbz();
        // update required fields

        action.setTzDhbz(tzDhbz);

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
        TzDhbz tzDhbz = new TzDhbz();
        tzDhbz.setDhbzId(-2L);
        action.setTzDhbz(tzDhbz);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
