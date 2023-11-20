#!/bin/bash

# ��ȡ�ű�����Ŀ¼�ľ���·��
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# ת����Ŀ��Ŀ¼
cd "$SCRIPT_DIR/.."

# ����Ŀ¼���ڴ�����е�jar��
mkdir -p package
# ������ղ���
mkdir -p package/result

# ��̬���á����ء����������ߡ����ؾ���(sermant-template)����ء���ǩ·�ɡ�������ǩ͸����ע��Ǩ�ơ�springbootע�ᡢ����ɼ��ԡ���Ⱥʵ��ժ��
mkdir -p package/dynamic-demo
mkdir -p package/flowcontrol-demo
mkdir -p package/grace-demo
mkdir -p package/load-balance-demo
mkdir -p package/monitor-demo
mkdir -p package/router-demo
mkdir -p package/tag-transmission-demo
mkdir -p package/registry-demo
mkdir -p package/springboot-registry-demo
mkdir -p package/visibility-demo
mkdir -p package/removal-demo

# �����ļ���ģʽ����Ӧ��jar�ļ����Ƶ���ӦĿ¼
# ��̬����
find . -type f -name "spring-provider.jar" -exec cp -v {} package/dynamic-demo/ \;
# ����
find . -type f -name "spring-provider.jar" -exec cp -v {} package/flowcontrol-demo/ \;
# ����������
find . -type f -name "nacos-rest-data-2.2.0.RELEASE.jar" -exec cp -v {} package/grace-demo/ \;
find . -type f -name "nacos-rest-consumer-2.2.0.RELEASE.jar" -exec cp -v {} package/grace-demo/ \;
find . -type f -name "nacos-rest-provider-2.2.0.RELEASE.jar" -exec cp -v {} package/grace-demo/ \;
# ���ؾ���
find . -type f -name "resttemplate-consumer.jar" -exec cp -v {} package/load-balance-demo/ \;
find . -type f -name "resttemplate-provider.jar" -exec cp -v {} package/load-balance-demo/ \;
# ���
find . -type f -name "monitor-demo-0.0.1-SNAPSHOT.jar" -exec cp -v {} package/monitor-demo/ \;
# ��ǩ·��
find . -type f -name "spring-cloud-router-consumer.jar" -exec cp -v {} package/router-demo/ \;
find . -type f -name "spring-cloud-router-provider.jar" -exec cp -v {} package/router-demo/ \;
find . -type f -name "spring-cloud-router-zuul.jar" -exec cp -v {} package/router-demo/ \;
# ������ǩ͸��
find . -type f -name "http-client-demo.jar" -exec cp -v {} package/tag-transmission-demo/ \;
find . -type f -name "http-server-demo.jar" -exec cp -v {} package/tag-transmission-demo/ \;
# ע��Ǩ��
find . -type f -name "dubbo-registry-consumer.jar" -exec cp -v {} package/registry-demo/ \;
find . -type f -name "dubbo-registry-provider.jar" -exec cp -v {} package/registry-demo/ \;
find . -type f -name "spring-cloud-registry-consumer.jar" -exec cp -v {} package/registry-demo/ \;
find . -type f -name "spring-cloud-registry-provider.jar" -exec cp -v {} package/registry-demo/ \;
# SpringBootע��
find . -type f -name "service-a.jar" -exec cp -v {} package/springboot-registry-demo/ \;
find . -type f -name "service-b.jar" -exec cp -v {} package/springboot-registry-demo/ \;
# ����ɼ���
find . -type f -name "dubbo-integration-provider.jar" -exec cp -v {} package/visibility-demo/ \;
find . -type f -name "dubbo-integration-consumer.jar" -exec cp -v {} package/visibility-demo/ \;
# ��Ⱥʵ��ժ��
find . -type f -name "rest-consumer-1.0.0.jar" -exec cp -v {} package/removal-demo/ \;
find . -type f -name "rest-provider-1.0.0.jar" -exec cp -v {} package/removal-demo/ \;


# ���
tar -czvf package/result/sermant-examples-dynamic-demo-$*.tar.gz -C package/dynamic-demo/ .
tar -czvf package/result/sermant-examples-flowcontrol-demo-$*.tar.gz -C package/flowcontrol-demo/ .
tar -czvf package/result/sermant-examples-grace-demo-$*.tar.gz -C package/grace-demo/ .
tar -czvf package/result/sermant-examples-load-balance-demo-$*.tar.gz -C package/load-balance-demo/ .
tar -czvf package/result/sermant-examples-monitor-demo-$*.tar.gz -C package/monitor-demo/ .
tar -czvf package/result/sermant-examples-router-demo-$*.tar.gz -C package/router-demo/ .
tar -czvf package/result/sermant-examples-tag-transmission-demo-$*.tar.gz -C package/tag-transmission-demo/ .
tar -czvf package/result/sermant-examples-registry-demo-$*.tar.gz -C package/registry-demo/ .
tar -czvf package/result/sermant-examples-springboot-registry-demo-$*.tar.gz -C package/springboot-registry-demo/ .
tar -czvf package/result/sermant-examples-visibility-demo-$*.tar.gz -C package/visibility-demo/ .
tar -czvf package/result/sermant-examples-removal-demo-$*.tar.gz -C package/removal-demo/ .