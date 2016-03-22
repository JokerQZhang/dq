package com.joker.dq.webapp.action;

import com.opensymphony.xwork2.ActionSupport;
import org.apache.struts2.ServletActionContext;
import com.joker.dq.service.CpChargeManager;
import com.joker.dq.model.CpCharge;
import com.joker.dq.webapp.action.BaseActionTestCase;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mock.web.MockHttpServletRequest;

import org.junit.After;
import org.junit.Before;
import org.junit.Test;
import static org.junit.Assert.*;

public class CpChargeActionTest extends BaseActionTestCase {
    private CpChargeAction action;

    @Autowired
    private CpChargeManager cpChargeManager;

    @Before
    public void onSetUp() {
        super.onSetUp();

        action = new CpChargeAction();
        action.setCpChargeManager(cpChargeManager);

        // add a test cpCharge to the database
        CpCharge cpCharge = new CpCharge();

        // enter all required fields

        cpChargeManager.save(cpCharge);
    }

    @Test
    public void testGetAllCpCharges() throws Exception {
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertTrue(action.getCpCharges().size() >= 1);
    }

    @Test
    public void testSearch() throws Exception {
        // regenerate indexes
        cpChargeManager.reindex();

        action.setQ("*");
        assertEquals(action.list(), ActionSupport.SUCCESS);
        assertEquals(4, action.getCpCharges().size());
    }

    @Test
    public void testEdit() throws Exception {
        log.debug("testing edit...");
        action.setCpChargeId(-1L);
        assertNull(action.getCpCharge());
        assertEquals("success", action.edit());
        assertNotNull(action.getCpCharge());
        assertFalse(action.hasActionErrors());
    }

    @Test
    public void testSave() throws Exception {
        MockHttpServletRequest request = new MockHttpServletRequest();
        ServletActionContext.setRequest(request);
        action.setCpChargeId(-1L);
        assertEquals("success", action.edit());
        assertNotNull(action.getCpCharge());

        CpCharge cpCharge = action.getCpCharge();
        // update required fields

        action.setCpCharge(cpCharge);

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
        CpCharge cpCharge = new CpCharge();
        cpCharge.setCpChargeId(-2L);
        action.setCpCharge(cpCharge);
        assertEquals("success", action.delete());
        assertNotNull(request.getSession().getAttribute("messages"));
    }
}
