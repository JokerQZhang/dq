package com.joker.dq.service;

import com.joker.dq.service.GenericManager;
import com.joker.dq.model.QuestionOption;
import com.joker.dq.model.TestQuestion;

import java.util.List;

import javax.jws.WebService;

@WebService
public interface TestQuestionManager extends GenericManager<TestQuestion, Long> {
    public Boolean saveOptions(List<QuestionOption> ol);
    public List<QuestionOption> getOl(Long questionId);
    public QuestionOption getQueationOption(Long qoid);
}