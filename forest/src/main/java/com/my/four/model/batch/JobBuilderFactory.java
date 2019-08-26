package com.my.four.model.batch;

import org.springframework.batch.core.job.builder.JobBuilder;
import org.springframework.batch.core.repository.JobRepository;

public class JobBuilderFactory {
	private JobRepository jobrepository;
	
	public JobBuilderFactory(JobRepository jobrepository) {
		this.jobrepository=jobrepository;
	}
	public JobBuilder get(String name) {
		JobBuilder builder = new JobBuilder(name).repository(jobrepository);
		return builder;
	}
}
