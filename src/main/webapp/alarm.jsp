<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link rel="stylesheet" type="text/css" href="/resources/css/views/alarm.css">
<script type="text/javascript" src="/resources/js/jquery.js"></script>
<script type="text/javascript" src="/resources/js/sockjs.js"></script>
<script type="text/javascript" src="/resources/js/stomp.js"></script>
<script type="text/javascript">
    var stompClient = null;

    var userId = '${LOGIN}';

    if(userId!=null && userId!=''){
        connect();
    }

    function connect() {
        var socket = new SockJS('/alarm');
        stompClient = Stomp.over(socket);
        stompClient.connect({}, function () {
            stompClient.subscribe('/topic/notice/' + '${LOGIN}', function (e) {
                showAlarm(JSON.parse(e.body));
            });
        });
    }

    function disconnect() {
        if (stompClient !== null) {
            stompClient.disconnect();
        }
    }

    function showAlarm(data){
        console.log(1)

        var html = '';

        html += '<a class="alarm" href="/group/"+'+data.groupNum+'>'
        html += '<div class="alert alert-primary" role="alert">';
        html += '<button type="button" class="close" data-dismiss="alert">x</span></button>'
        html += data.requestId + '님이 '+ data.groupName + '모임에 참가를 원합니다!'
        html += '</div></a>';

        $('body').append(html)
    }
</script>
