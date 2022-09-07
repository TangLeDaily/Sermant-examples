/*
 * Copyright (C) 2022-2022 Huawei Technologies Co., Ltd. All rights reserved.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 *
 */

package com.huaweicloud.examples.flow.consumer;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import java.util.Enumeration;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;

/**
 * 流控测试
 *
 * @author zhouss
 * @since 2022-08-01
 */
@Controller
@ResponseBody
public class FlowController {
    @Autowired
    private RestTemplate restTemplate;

    @Autowired
    private FeignRequest feignRequest;

    /**
     * 流控测试接口
     *
     * @param exRate 异常率
     * @return ok
     */
    @RequestMapping(value = "/feign/flow", method = RequestMethod.GET)
    public String feignFlow(@RequestParam(required = false) Integer exRate) {
        return feignRequest.flow(exRate);
    }

    /**
     * 流控测试接口
     *
     * @param exRate 异常率
     * @param request 请求信息
     * @return ok
     */
    @RequestMapping(value = "/flow", method = RequestMethod.GET)
    public String flow(@RequestParam(required = false) Integer exRate, HttpServletRequest request) {
        HttpEntity<String> requestEntity = new HttpEntity<>(buildHeaders(request));
        final ResponseEntity<String> exchange = restTemplate
                .exchange(String.format(Locale.ENGLISH, "http://spring-flow-provider/flow?exRate=%s",
                        exRate == null ? 0 : exRate), HttpMethod.GET, requestEntity, String.class);
        if (exchange.getStatusCode() == HttpStatus.OK) {
            return exchange.getBody();
        }
        return "failed";
    }

    private HttpHeaders buildHeaders(HttpServletRequest request) {
        final HttpHeaders httpHeaders = new HttpHeaders();
        final Enumeration<String> headerNames = request.getHeaderNames();
        while (headerNames.hasMoreElements()) {
            final String headerKey = headerNames.nextElement();
            httpHeaders.add(headerKey, request.getHeader(headerKey));
        }
        return httpHeaders;
    }
}
