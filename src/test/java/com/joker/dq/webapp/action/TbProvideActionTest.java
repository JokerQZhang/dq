package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TbProvideManager;
import com.joker.dq.model.TbProvide;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TbProvideActionTest extends BaseActionTestCase {
    private TbProvideAction action;

    @Autowired
    private TbProvideManager tbProvideManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TbProvideAction();
        action.setTbProvideManager(tbProvideManager);

        // add a test tbProvide to the database
        TbProvide tbProvide = new TbProvide();

        // enter all required fields

        tbProvideManager.save(tbProvide);
    }

    @Test
    public void testGetAllTbProvides() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTbProvides().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tbProvideManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTbProvides().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setProvideId(-1L);
        assertNull(action.getTbProvide());
        assertEquals("success", action.edit());
        assertNotNull(action.getTbProvide());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setProvideId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTbProvide());

        TbProvide tbProvide = action.getTbProvide();
        // update required fields

        action.setTbProvide(tbProvide);

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
        TbProvide tbProvide = new TbProvide();
        tbProvide.setProvideId(-2L);
        action.setTbProvide(tbProvide);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
