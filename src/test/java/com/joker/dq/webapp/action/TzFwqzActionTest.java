package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzFwqzManager;
import com.joker.dq.model.TzFwqz;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzFwqzActionTest extends BaseActionTestCase {
    private TzFwqzAction action;

    @Autowired
    private TzFwqzManager tzFwqzManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzFwqzAction();
        action.setTzFwqzManager(tzFwqzManager);

        // add a test tzFwqz to the database
        TzFwqz tzFwqz = new TzFwqz();

        // enter all required fields

        tzFwqzManager.save(tzFwqz);
    }

    @Test
    public void testGetAllTzFwqzs() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzFwqzs().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzFwqzManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzFwqzs().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setFwqzId(-1L);
        assertNull(action.getTzFwqz());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzFwqz());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setFwqzId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzFwqz());

        TzFwqz tzFwqz = action.getTzFwqz();
        // update required fields

        action.setTzFwqz(tzFwqz);

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
        TzFwqz tzFwqz = new TzFwqz();
        tzFwqz.setFwqzId(-2L);
        action.setTzFwqz(tzFwqz);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
