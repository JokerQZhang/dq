package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TzGfmzManager;
import com.joker.dq.model.TzGfmz;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TzGfmzActionTest extends BaseActionTestCase {
    private TzGfmzAction action;

    @Autowired
    private TzGfmzManager tzGfmzManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TzGfmzAction();
        action.setTzGfmzManager(tzGfmzManager);

        // add a test tzGfmz to the database
        TzGfmz tzGfmz = new TzGfmz();

        // enter all required fields

        tzGfmzManager.save(tzGfmz);
    }

    @Test
    public void testGetAllTzGfmzs() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTzGfmzs().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tzGfmzManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTzGfmzs().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setGfmzId(-1L);
        assertNull(action.getTzGfmz());
        assertEquals("success", action.edit());
        assertNotNull(action.getTzGfmz());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setGfmzId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTzGfmz());

        TzGfmz tzGfmz = action.getTzGfmz();
        // update required fields

        action.setTzGfmz(tzGfmz);

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
        TzGfmz tzGfmz = new TzGfmz();
        tzGfmz.setGfmzId(-2L);
        action.setTzGfmz(tzGfmz);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
