package com.joker.dq.dao;

import com.joker.dq.dao.BaseDaoTestCase;
import com.joker.dq.model.CpCharge;
import org.springframework.dao.DataAccessException;

import static org.junit.Assert.*;
import org.junit.Test;

import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

public class CpChargeDaoTest extends BaseDaoTestCase {
    @Autowired
    private CpChargeDao cpChargeDao;

    @Test(expected=DataAccessException.class)
    public void testAddAndRemoveCpCharge() {
        CpCharge cpCharge = new CpCharge();

        // enter all required fields

        log.debug("adding cpCharge...");
        cpCharge = cpChargeDao.save(cpCharge);

        cpCharge = cpChargeDao.get(cpCharge.getCpChargeId());

        assertNotNull(cpCharge.getCpChargeId());

        log.debug("removing cpCharge...");

        cpChargeDao.remove(cpCharge.getCpChargeId());

        // should throw DataAccessException 
        cpChargeDao.get(cpCharge.getCpChargeId());
    }
}