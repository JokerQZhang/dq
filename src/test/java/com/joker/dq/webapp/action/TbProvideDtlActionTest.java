package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.TbProvideDtlManager;
import com.joker.dq.model.TbProvideDtl;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class TbProvideDtlActionTest extends BaseActionTestCase {
    private TbProvideDtlAction action;

    @Autowired
    private TbProvideDtlManager tbProvideDtlManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new TbProvideDtlAction();
        action.setTbProvideDtlManager(tbProvideDtlManager);

        // add a test tbProvideDtl to the database
        TbProvideDtl tbProvideDtl = new TbProvideDtl();

        // enter all required fields

        tbProvideDtlManager.save(tbProvideDtl);
    }

    @Test
    public void testGetAllTbProvideDtls() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getTbProvideDtls().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        tbProvideDtlManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getTbProvideDtls().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setProvideDtlId(-1L);
        assertNull(action.getTbProvideDtl());
        assertEquals("success", action.edit());
        assertNotNull(action.getTbProvideDtl());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setProvideDtlId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getTbProvideDtl());

        TbProvideDtl tbProvideDtl = action.getTbProvideDtl();
        // update required fields

        action.setTbProvideDtl(tbProvideDtl);

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
        TbProvideDtl tbProvideDtl = new TbProvideDtl();
        tbProvideDtl.setProvideDtlId(-2L);
        action.setTbProvideDtl(tbProvideDtl);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
