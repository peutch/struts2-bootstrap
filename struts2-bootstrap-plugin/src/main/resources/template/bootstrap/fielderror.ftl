<#--
/*
 * Licensed to the Apache Software Foundation (ASF) under one
 * or more contributor license agreements.  See the NOTICE file
 * distributed with this work for additional information
 * regarding copyright ownership.  The ASF licenses this file
 * to you under the Apache License, Version 2.0 (the
 * "License"); you may not use this file except in compliance
 * with the License.  You may obtain a copy of the License at
 *
 *  http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing,
 * software distributed under the License is distributed on an
 * "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY
 * KIND, either express or implied.  See the License for the
 * specific language governing permissions and limitations
 * under the License.
 */
-->
<#if fieldErrors??><#t/>
    <#assign eKeys = fieldErrors.keySet()><#t/>
    <#assign eKeysSize = eKeys.size()><#t/>
    <#assign doneStartUlTag=false><#t/>
    <#assign doneEndUlTag=false><#t/>
    <#assign haveMatchedErrorField=false><#t/>
    <#if (fieldErrorFieldNames?size > 0) ><#t/>
        <#list fieldErrorFieldNames as fieldErrorFieldName><#t/>
            <#list eKeys as eKey><#t/>
                <#if eKey == fieldErrorFieldName?j_string><#t/>
                    <#assign haveMatchedErrorField=true><#t/>
                    <#assign eValue = fieldErrors.get(fieldErrorFieldName?j_string)><#t/>
                    <#if (haveMatchedErrorField && (!doneStartUlTag))><#t/>
                        <#assign doneStartUlTag=true><#t/>
                    </#if><#t/>
                <div
                    <#if attributes.id?has_content>
                            id="${attributes.id}"<#rt/>
                    </#if>
                    <#if attributes.cssClass??>
                            class="alert alert-danger ${attributes.cssClass}"<#rt/>
                    <#else>
                            class="alert alert-danger actionError"<#rt/>
                    </#if>
                    <#if attributes.cssStyle??>
                            style="margin${attributes.cssStyle}"<#rt/>
                    </#if>
                        >
                    <#list eValue as eEachValue><#t/>
                        <#if eEachValue?has_content>
                            <div><#if attributes.escape>${eEachValue!}<#else>${eEachValue!}</#if></div>
                        </#if>
                    </#list>
                </div>
                </#if><#t/>
            </#list><#t/>
        </#list><#t/>
        <#if (haveMatchedErrorField && (!doneEndUlTag))><#t/>
            <#assign doneEndUlTag=true><#t/>
        </#if><#t/>
    <#else><#t/>
        <#if (eKeysSize > 0)><#t/>
        <div
            <#if attributes.id?has_content>
                    id="${attributes.id}"<#rt/>
            </#if>
            <#if attributes.cssClass??>
                    class="alert alert-danger ${attributes.cssClass}"<#rt/>
            <#else>
                    class="alert alert-danger actionError"<#rt/>
            </#if>
            <#if attributes.cssStyle??>
                    style="margin${attributes.cssStyle}"<#rt/>
            </#if>
                >
            <#list eKeys as eKey><#t/>
                <#assign eValue = fieldErrors.get(eKey?j_string)><#t/>
                <#list eValue as eEachValue><#t/>
                    <#if eEachValue?has_content>
                        <div class="mb-0"><#if attributes.escape>${eEachValue!}<#else>${eEachValue!}</#if></div>
                    </#if>
                </#list>
            </#list><#t/>
        </div>
        </#if><#t/>
    </#if><#t/>
</#if><#t/>
