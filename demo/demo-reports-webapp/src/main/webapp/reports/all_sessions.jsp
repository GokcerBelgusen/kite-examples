<%--
  Copyright 2013 Cloudera Inc.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

  http://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License.
--%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql" %>
<html>
<head>
<title>All sessions</title>
<link rel="stylesheet" type="text/css" href="report.css">
<head>
<body>
<h2>All sessions</h2>
<p>
<%-- Need to refresh Impala metadata to pick up any new data files, see http://www.cloudera.com/content/cloudera-content/cloudera-docs/Impala/latest/Installing-and-Using-Impala/ciiu_langref_sql.html?scroll=refresh_unique_1 --%>
<sql:update dataSource="jdbc/impala">
  refresh sessions
</sql:update>
<sql:query var='queryResults' dataSource="jdbc/impala">
  select * from sessions
</sql:query>
<%@ include file="display_query_results.jspf" %>
<p>
</form>
</body>
</html>
