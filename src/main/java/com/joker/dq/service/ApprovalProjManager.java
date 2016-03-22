package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.ApprovalProj;

import java.util.List;
import javax.jws.WebService;

@WebService
public interface ApprovalProjManager extends GenericManager<ApprovalProj, Long> {
    
}