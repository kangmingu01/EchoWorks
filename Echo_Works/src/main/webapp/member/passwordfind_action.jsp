<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="echoworks.dao.MemberDAO, echoworks.dto.MemberDTO, echoworks.util.Utility"%>
<%
    // 사용자가 입력한 이름, 이메일, 아이디를 받음
    String name = request.getParameter("name");
    String email = request.getParameter("email");
    String id = request.getParameter("id");

    // MemberDAO를 사용하여 데이터베이스에서 사용자를 찾음
    MemberDTO member = MemberDAO.getDAO().selectMemberByEmailNameAndId(email, name, id);

    if (member != null) {
        // 임시 비밀번호 생성 및 암호화
        String tempPassword = Utility.generateRandomPassword();
        String encryptedPassword = Utility.encrypt(tempPassword);

        // 임시 비밀번호를 데이터베이스에 업데이트
        member.setMemberPasswd(encryptedPassword);
        MemberDAO.getDAO().updatePassword(member);

        // 화면에 결과 출력
        out.println("<div class='alert alert-success' role='alert'>");
        out.println(name + "님의 임시 비밀번호는 <strong>" + tempPassword + "</strong> 입니다.");
        out.println("</div>");
    } else {
        // 사용자를 찾을 수 없을 때의 처리
        out.println("<div class='alert alert-danger' role='alert'>");
        out.println("입력하신 정보와 일치하는 사용자가 없습니다.");
        out.println("</div>");
    }
%>
