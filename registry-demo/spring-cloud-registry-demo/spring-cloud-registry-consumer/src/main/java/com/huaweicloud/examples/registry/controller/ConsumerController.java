/*
 * Copyright (C) 2022-2022 Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.huaweicloud.examples.registry.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

/**
 * ConsumerController
 *
 * @author provenceee
 * @since 2022-08-29
 */
@RestController
public class ConsumerController {
    private static final String PROVIDER_URL = "http://spring-cloud-registry-provider/hello";

    @Autowired
    private RestTemplate restTemplate;

    /**
     * 测试方法
     *
     * @return msg
     */
    @GetMapping("hello")
    public String hello() {
        return restTemplate.getForObject(PROVIDER_URL, String.class);
    }
}