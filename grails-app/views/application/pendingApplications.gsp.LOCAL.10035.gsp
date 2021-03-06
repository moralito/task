<!doctype html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="layout" content="back">
	<title>Solicitudes de servicio</title>
	<r:require modules = "bootstrap-css, bootstrap-responsive-css, bootstrap-dropdown, style"/>
</head>
<body>
	<div class="row">
		<div class="span10">
			<div class="pull-right">
				<div class="btn-group">
				    <a class="btn dropdown-toggle" data-toggle="dropdown" href="#">
				    	Solicitudes de servicio
				    	<span class="caret"></span>
				    </a>
					<ul class="dropdown-menu">
						<li><g:link action="pendingApplications">Todas</g:link></li>
                        <li class="divider"></li>
                        <li><g:link action="pendingApplications" params="[state:'pending']">Pendientes</g:link></li>
						<li><g:link action="pendingApplications" params="[state:'attending']">Atendiendose</g:link></li>
						<li><g:link action="pendingApplications" params="[state:'attended']">Atendidas</g:link></li>
					</ul>
				</div>
			</div>
		</div>
	</div>

	<br>

    <g:if test="${apps}">
    	<table class="table table-hover">
    		<thead>
    			<th>Descripcion</th>
    			<th></th>
                <th></th>
    		</thead>
    		<tbdoy>
    			<g:each in="${apps}" var="app">
    				<tr>
    					<td>
    						<g:link action="show" id="${app.id}">
    							${app.description} por <strong>${app.user.fullName}</strong> - ${app.user.department}
    						</g:link>
    					</td>
    					<td class="td-mini">
    						<g:link action="updateState" id="${app.id}">${app.state}</g:link>
    					</td>
                        <td class="td-mini">
                            <g:renderDate date="${app.dateCreated}"/>

                        </td>
    				</tr>
    			</g:each>
    		</tbdoy>
    	</table>
    </g:if>
    <g:else>
    	<div class="alert alert-info">nothing.to.show</div>
    </g:else>
</body>
</html>