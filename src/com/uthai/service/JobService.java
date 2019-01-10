package com.uthai.service;

import com.uthai.po.TbJob;
import net.sf.json.JSONArray;

public interface JobService {
    boolean createJob(TbJob job);
    JSONArray getJobList();
}
