<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@include file="/WEB-INF/views/include/header.jsp"%>

<link rel="stylesheet"
	href='<c:url value="/resources/css/commons/doctorJoin.css"/>'>

<section class="content">
	
	<div class="join_box">
		<form class="doc_box" enctype="multipart/form-data">
			<h2 class="form-signin-heading">기본정보 입력</h2>
			<legend></legend>
			<input type="hidden" name="doc_code" id="doc_code"/>
			<div class="row">
				<div class="col-md-2">
					<label for="doc_name">이름</label> <span class="star">＊</span>
				</div>
				<input type="text" class="form-control" id="doc_name" name="doc_name" maxlength="20"
					value='' />
				<p class="validation-txt" id="messageName" style="display: none;"></p>
			</div>
			<br />
			
			<div class="row">
				<div class="col-md-2">
					<label for="doc_birth">주민번호</label> <span class="star">＊</span>
				</div>
				<input type="text" class="form-control two" id="doc_birth1" name="doc_birth1" maxlength="6"
					value='' />&nbsp;&nbsp;-&nbsp;&nbsp;<input type="password" class="form-control two" id="doc_birth2" name="doc_birth2"
					maxlength="7" value='' />
	
			</div>
			<br />
	
			<div class="row">
				<div class="col-md-2">
					<label for="doc_pwd">비밀번호</label> <span class="star">*</span>
				</div>
				<input type="password" class="form-control" id="doc_pwd" name="doc_pwd" maxlength="20" />
				<span class="tip-txt" style="color: blue">영문, 숫자 2가지 이상 조합으로
					10~20자 이여야 합니다.</span>
				<p class="validation-txt" id="messagePass" style="display: none;"></p>
	
			</div>
			<br />
	
			<div class="row">
				<div class="col-md-2">
					<label for="doc_pwd_chk">비밀번호 확인</label> <span class="star">*</span>
				</div>
				<input type="password" class="form-control" id="doc_pwd_chk" name="doc_pwd_chk"
					maxlength="20" /> <span class="tip-txt" style="color: blue">비밀번호
					확인을 위해 다시 한 번 입력해주세요.</span>
				<p class="validation-txt" id="messagePassConf" style="display: none;"></p>
	
			</div>
			<br />
	
			<div class="row">
				<div class="col-md-2">
					<label for="doc_phone1">휴대폰</label> <span class="star">*</span>
				</div>
				<select name="doc_phone1" class="form-control three" id="doc_phone1" title="휴대폰 첫번째 자리 입력">
					<option value="010">010</option>
					<option value="011">011</option>
					<option value="016">016</option>
					<option value="017">017</option>
					<option value="018">018</option>
					<option value="019">019</option>
				</select> &nbsp;-&nbsp; <input type="text" class="form-control three" id="doc_phone2" name="doc_phone2" maxlength="4" />
				&nbsp;-&nbsp; <input type="text" class="form-control three" id="doc_phone3" name="doc_phone3" maxlength="4" />
	
			</div>
			<br />
			<div class="row">
				<div class="col-md-2">
					<label for="doc_email1">이메일</label> <span class="star">*</span>
				</div>
				<input type="text" id="doc_email1" class="form-control two" name="doc_email1" maxlength="20">&nbsp;@&nbsp;
				<input type="text" id="doc_email2" class="form-control two" name="doc_email2" maxlength="20"
					readonly="readonly" /> <select name="doc_email3" class="form-control two"
					onchange="email3(this.value)">
	
					<option value="">선택하세요.</option>
					<option value="hanmail.net">hanmail.net</option>
					<option value="naver.com">naver.com</option>
					<option value="chol.com">chol.com</option>
					<option value="dreamwiz.com">dreamwiz.com</option>
					<option value="empal.com">empal.com</option>
					<option value="freechal.com">freechal.com</option>
					<option value="gmail.com">gmail.com</option>
					<option value="hanafos.com">hanafos.com</option>
					<option value="hanmir.com">hanmir.com</option>
					<option value="hitel.net">hitel.net</option>
					<option value="hotmail.com">hotmail.com</option>
					<option value="korea.com">korea.com</option>
					<option value="lycos.co.kr">lycos.co.kr</option>
					<option value="nate.com">nate.com</option>
					<option value="netian.com">netian.com</option>
					<option value="paran.com">paran.com</option>
					<option value="yahoo.com">yahoo.com</option>
					<option value="0">직접입력</option>
				</select>
	
			</div>
			<br />
	
			<div class="row">
				<div class="col-md-2">
					<label for="doc_addr">주소</label> <span class="star">*</span>
				</div>
				<input type="text" class="form-control two" id="doc_addr_number" name="doc_addr_number" placeholder="우편번호" readonly="readonly"> <input
					type="button" onclick="addrPostcode()" style="color: blue" value="우편번호 찾기"> <br />
				<br />
				<div class="col-md-2"></div>
				<input type="text" class="form-control" id="doc_addr1" name="doc_addr1"
					placeholder="주소"> &nbsp; <input type="text" class="form-control"
					id="doc_addr2" name="doc_addr2" placeholder="상세주소">
			</div>
	
			<legend style="margin: 30px 0;"></legend>
	
			<h2 class="form-signin-heading" style="margin: 10px;">진료과 입력</h2>
	
			<div class="row" style="margin-top: 10px;">
				<div class="col-md-2">
					<label for="depart_name">진료과</label> <span class="star">*</span>
				</div>
				<select name="depart_field" class="form-control" id="depart_field" name="depart_field">
					<c:forEach var="departList" items="${departList }">
						<option value="${departList.depart_code }">${departList.depart_name }</option>
					</c:forEach>
				</select>
			</div>
			<br />
	
			<div class="row">
				<div class="col-md-2">
					<label>진료 분야</label> 
					<span class="star">*</span>
				</div>
				<div class="col-md-10 field_list">
				<input type="hidden" name="doc_field" id="doc_field"/>
				</div>
			</div>
			<legend style="margin: 30px 0;"></legend>
	
			<DIV
				style='overflow: scroll; width: 670px; height: 400px; margin-top: 30px; padding: 10px; background-color: #F9F9F9; border: 1px solid #BDBDBD;'>
	
				<p align=center>
					<section class="agree-section">
						<section class="agree-item agree-item-100">
							<div class="section-heading">
								<h3 class="section-heading-title">이용약관</h3>
								<strong class="star">(필수사항)</strong>
							</div>
							<div id="SRVC_AGREE_CONT" class="agree-txt scrollable">
	
								<h1>제1장 총칙 제1조 (목적)</h1>
								<br />
								<p>삼성서울병원(이하 &quot;병원&quot;이라 합니다)에서 운영하는 인터넷 홈페이지에서
									제공하는 인터넷 관련 서비스(이하 &quot;서비스&quot;라 합니다)의 이용에 관한 사항을
									규정함을 목적으로 합니다.</p>
								<br />
								<h2>제2조 (정의)</h2>
								<ol>
									<li>1. 이용자(회원) : 인터넷 홈페이지에 로그인하여 본 약관에 따라 병원이 제공하는 서비스를 받는
										자를 말합니다.</li>
									<!-- li>2. 운영자 : 서비스의 전반적인 관리와 원활한 운영을 위하여 병원에서 선정한 사람&lt;/li -'->
				<!-- 20160120 삭제 -->
									<li>2. 연결사이트 : 홈페이지와 하이퍼링크 방식(하이퍼링크의 대상에는 문자, 정지 및 동화상 등이
										포함됨) 등으로 연결된 웹 사이트를 말합니다.</li>
									<li>3. 개인정보 : 당해 정보에 포함되어 있는 성명, ID,환자번호 등의 사항에 의하여 특정 개인을
										식별할 수 있는 정보(당해 정보만으로는 특정 개인을 인식할 수 없더라도 다른 정보와 용이하게 결합하여 식별할 수
										있는 것을 포함한다)를 말합니다.</li>
									<!-- li>5. 해지 : 이용자가 서비스 개통 후 이용계약을 해약하는 것 </li -->
									<!-- 20160120 삭제 -->
								</ol>
	
								<h2>제3조 (약관의 게시 및 변경)</h2>
								<ol>
									<li>1. 병원은 본 약관의 내용과 상호, 병원 소재지, 전자우편 주소 등을 이용자가 알 수 있도록
										홈페이지에 게시합니다.</li>
									<li>2. 병원은 불가피한 사정이 있는 경우 관계법령을 위배하지 않는 범위에서 본 약관을 개정할 수
										있습니다.</li>
									<li>3. 병원은 약관을 개정할 경우에는 전항과 같은 방법으로 공지 또는 통보함으로써 효력을 발생합니다.</li>
									<li>4. 이 약관에서 정하지 아니한 사항과 이 약관의 해석에 관하여는 관계법령 또는 상관례에 따릅니다.</li>
								</ol>
	
								<h2>제4조 (서비스의 내용 및 변경)</h2>
								<ol>
									<li>1. 병원은 다음의 서비스를 제공합니다.
										<ol>
											<li>Ⅰ. 병원의 의료진 및 진료일정 안내</li>
											<li>Ⅱ. 병원 또는 연결사이트를 통해 제공되는 각종 예약 서비스</li>
											<li>Ⅲ. 병원 또는 연결사이트를 통해서 제공되는 건강상담 서비스</li>
											<li>Ⅳ. 병원에서 제공하는 건강정보</li>
											<li>Ⅴ. 기타 병원이 정하는 서비스</li>
										</ol>
									</li>
									<li>2. 병원은 불가피한 사정이 있는 경우 제공하는 서비스의 내용을 변경할 수 있으며, 이 경우 변경된
										서비스의 내용 및 제공일자를 명시하여 홈페이지에 게시하거나 기타의 방법으로 이용자에게 통보합니다.</li>
									<li>3. 병원은 서비스 내용의 변경으로 인하여 이용자가 입은 손해에 대하여 배상하지 아니합니다. 단,
										병원의 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.</li>
								</ol>
	
								<h2>제5조 (서비스의 중단)</h2>
								<ol>
									<li>1. 병원은 시스템 등 장치의 보수점검·교체 및 고장, 통신의 두절, 기타 불가항력적 사유가 발생한
										경우에는 서비스의 제공을 일시적으로 중단할 수 있습니다.</li>
									<li>2. 병원은 제1항의 사유로 서비스 제공이 일시적으로 중단됨으로 인하여 이용자 또는 제3자가 입은
										손해에 대하여는 배상하지 아니합니다. 단, 병원의 고의 또는 중과실이 있는 경우에는 그러하지 아니합니다.</li>
								</ol>
	
								<h1>제2장 회원의 가입 및 탈퇴</h1>
	
								<h2>제6조 (회원가입)</h2>
								<ol>
									<li>1. 이용자는 병원의 정한 양식에 따라 회원정보를 기입한 후 본 약관에 동의한다는 의사표시를
										함으로써 회원가입을 신청합니다.</li>
									<li>2. 병원은 전항과 같이 회원으로 가입할 것을 신청한 이용자 중 이하 각호에 해당하지 않는 한
										회원으로 등록합니다.
										<ol>
											<li>Ⅰ. 가입신청자가 본 약관 제7조 제2항에 의거하여 이전에 회원 자격을 상실한 적이 있는 경우</li>
											<li>Ⅱ. 등록내용에 허위, 기재누락, 오기가 있는 경우</li>
											<li>Ⅲ. 기타 회원으로 등록하는 것이 병원의 기술상 또는 업무 수행상 현저히 지장이 있다고 판단하는
												경우</li>
											<li>Ⅳ. 입력한 비밀번호가 10~20자 길이로, 영문 숫자 혼용이 아닌 경우</li>
										</ol>
									</li>
									<li>3. 회원가입계약의 성립시기는 병원이 승낙한 시점으로 합니다.</li>
									<li>4. 회원은 등록사항에 변경이 있는 경우, 즉시 전자우편 또는 기타 방법으로 병원에 그 변경사항을
										알려야 합니다.</li>
								</ol>
	
								<h2>제7조 (회원 탈퇴 및 자격의 상실등)</h2>
								<ol>
									<li>1. 회원은 병원에 언제든지 탈퇴를 요청할 수 있으며 병원은 즉시 회원탈퇴를 처리합니다. 단,
										탈퇴의 요청은 홈페이지 또는 전화로 하여야 하며, 요청하는 자의 이름, 전화번호, 탈퇴사유등을 기재하여야 합니다.</li>
									<li>2. 회원이 다음 각호의 사유에 해당하는 경우, 병원은 회원자격을 상실시킬 수 있습니다.
										<ol>
											<li>Ⅰ. 등록 신청 시에 허위 내용을 등록한 경우</li>
											<li>Ⅱ. 다른 사람의 서비스 이용을 방해하거나 그 정보를 도용하는 등 질서를 위협하는 경우</li>
											<li>Ⅲ. 병원 내에서 검증되지 않은 허위정보 및 기타 허락되지 않은 물품의 판 매 행위를 하는 경우</li>
											<li>Ⅳ. 병원 내에서 허락되지 않은 진료행위 또는 진료행위를 위한 선전의 장소로 이용하는 경우</li>
											<li>Ⅴ. 병원 내에 제공되는 정보를 변경하는 등 홈페이지 운영을 방해한 경우</li>
											<li>Ⅵ. 병원을 이용하여 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하는 경우</li>
											<li>Ⅶ. 본 약관을 위반한 경우</li>
											<li>Ⅷ. 기타 회원으로서의 자격을 지속시키는 것이 부적절하다고 판단되는 경우</li>
										</ol>
									</li>
									<li>3. 삼성서울병원 인터넷 사이트를 통하여 진료예약을 한 후 정당한 사유 없이 2회 이상 진료예약을
										포기하거나 예약한 진료를 받지 않은 경우 인터넷 진료예약서비스에 대한 자격을 1년간 제한합니다.</li>
								</ol>
	
								<h2>제8조 (회원에 대한 통지)</h2>
								<ol>
									<li>1. 병원은 회원에 대한 통지를 하는 경우, 회원이 병원에 제공한 전자우편 주소 또는 전화번호로 할
										수 있습니다.</li>
									<li>2. 병원은 불특정다수 회원에 대한 통지의 경우 게시판에 게시함으로써 개별통지에 갈음할 수
										있습니다.</li>
								</ol>
	
								<h2>제9조 (진료예약의 신청 및 성립)</h2>
								<ol>
									<li>1. 이용자는 홈페이지상에서 이하의 방법에 의하여 진료예약을 신청합니다.
										<ol>
											<li>Ⅰ. 주민등록번호(실명인증), 비밀번호, 성명, 주소, 전화번호 입력</li>
											<li>Ⅱ. 의료진,진료과,예약일시 선택</li>
											<li>Ⅲ. 이 약관에 동의한다는 표시</li>
										</ol>
									</li>
									<li>2. 병원은 제1항의 예약신청에 대하여 다음 각호의 사유에 해당하지 않는 한 승낙합니다.
										<ol>
											<li>Ⅰ. 신청 내용에 허위, 기재누락, 오기가 있는 경우</li>
											<li>Ⅱ. 기타 예약신청에 승낙하는 것이 기술상 현저히 지장이 있다고 판단하는 경우</li>
										</ol>
									</li>
									<li>3. 병원의 승낙 통지가 이용자의 전자우편으로 도달된 때에 예약이 성립된 것으로 봅니다.</li>
								</ol>
	
								<h1>제3장 개인정보의 보호</h1>
	
								<h2>제10조 (개인정보의 수집)</h2>
								<ol>
									<li>1. 본 서비스의 원활한 활용을 위해 필요한 이용자의 개인정보를 수집할 수 있습니다. <!-- ol>
											<li>Ⅰ. 성명</li>
											<li>Ⅱ. 전화번호</li>
											<li>Ⅲ. 비밀번호</li>
											<li>Ⅳ. 전자우편 주소</li>
										</ol --></li>
									<li>2. 이용자의 개인정보를 수집하는 때에는 이하 각호의 경우를 제외하고는 당해 이용자의 동의를
										받습니다.
										<ol>
											<li>Ⅰ. 법률에 특별한 규정이 있는 경우</li>
											<li>Ⅱ. 서비스이용계약의 이행을 위해서 필요한 경우</li>
											<li>Ⅲ. 서비스의 제공에 따른 요금정산을 위하여 필요한 경우</li>
										</ol>
									</li>
									<li>3. 병원은 개인정보의 보호를 위하여 관리자를 한정하여 그 수를 최소화하며 개인정보의 분실, 도난,
										유출, 변조되지 아니하도록 안정성 확보에 필요한 기술적 조치 등을 강구합니다.</li>
									<li>4. 병원은 개인정보의 수집목적을 달성한 때에는 당해 개인정보를 지체없이 파기합니다.</li>
								</ol>
	
								<h2>제11조(개인정보의 관리책임자)</h2>
								<ol>
									<li>• 개인정보관리책임자 : 정규하 담당</li>
									<li>• 개인정보보호 실무담당자 : 박종환 팀장</li>
									<li>• 소속부서 : 삼성의료원 정보보안팀</li>
									<li>• 전화번호 : 02-3410-0370</li>
									<li>• 이메일 : security.smc@samsung.com</li>
								</ol>
	
								<h2>제12조(개인정보의 수집목적 및 이용목적)</h2>
								<ol>
									<li>1. 이용자에게 원활한 의료정보 제공을 위한 온라인 및 오프라인에서의 공지기능</li>
									<li>2. 사용자 인증 절차 및 병원내 진료정보서비스 제공</li>
									<li>3. 병원 홈페이지의 홈페이지 원활한 운영 및 통계분석자료로 활용</li>
								</ol>
	
								<h2>제13조(개인정보의 보유기간 및 이용기간)</h2>
								<p>병원은 회원 자격을 가지고 있는 기간을 개인정보의 보유기간 및 이용기간으로 정합니다.</p>
								<br />
	
								<h2>제14조(개인정보의 이용 및 제공의 제한)</h2>
								<ol>
									<li>1. 제공된 개인정보는 당해 이용자의 동의없이 목적외 이용이나 제3자에게 제공할 수 없으며, 이에
										따른 이용자의 피해에 대한 모든 책임은 병원이 집니다. 단, 다음의 경우에는 예외로 합니다.
										<ol>
											<li>Ⅰ. 법률에 특별한 규정이 있는 경우</li>
											<li>Ⅱ. 서비스의 제공에 따른 요금정산 및 배송등을 위하여 필요한 경우</li>
											<li>Ⅲ. 통계작성·학술연구 또는 시장조사를 위하여 필요한 경우로서 특정 개인을 식별할 수 없는
												형태로 제공하는 경우</li>
										</ol>
									</li>
									<!--  li>2. 정보통신서비스제공자로부터 이용자의 개인정보를 제공받은 자는 당해 이용자의 동의가 있거나 다른 법률에 특별한 규정이 있는 경우를 제외하고는 개인정보를 제공받은 목적외의 용도로 이를 이용하거나 제3자에게 제공하여서는 안됩니다.</li -->
								</ol>
	
								<h2>제15조(이용자의 권리)</h2>
								<ol>
									<li>1. 이용자는 언제든지 제10조 제2항, 제15조 제1항 또는 동조 제2항의 규정에 의한 동의를
										철회할 수 있습니다. 단, 철회의 의사표시는 병원 또는 병원으로부터 정보를 제공받은 자에게 전자우편이 도달된
										때로부터 유효합니다.</li>
									<li>2. 이용자는 병원에게 자신의 개인정보에 대한 열람을 요구할 수 있으며, 자신의 개인정보에 오류가
										있는 경우에는 그 정정을 요구할 수 있습니다.</li>
									<li>3. 제1항 및 제2항에 의한 철회, 열람, 정정의 요구는 병원에 전자우편을 보내는 방식으로 하여야
										하며, 병원은 전자우편이 도달된 후 지체없이 필요한 조치를 취할 의무를 집니다. 이용자가 오류의 정정을 요구한
										경우에는 병원이 그 오류를 정정할 때까지 당해 개인정보를 이용하지 않습니다.</li>
								</ol>
	
								<h1>제4장 서비스에 관한 책임의 제한</h1>
	
								<h2>제16조 (건강상담서비스)</h2>
								<ol>
									<li>1. 병원은 이용자의 상담 내용이 상담의사를 제외한 제3자에게 유출되지 않도록 최선을 다해 보안을
										유지하려고 노력합니다. 다만, 다음 각호의 사유로 인하여 상담 내용이 공개 또는 훼손된 경우 병원은 책임을 지지
										않습니다.
										<ol>
											<li>Ⅰ. 사용자의 부주의로 비밀번호가 유출된 경우</li>
											<li>Ⅱ. 사용자가 '상담삭제' 기능을 사용한 경우</li>
											<li>Ⅲ. 천재지변등 기타 불가항력에 의한 경우</li>
										</ol>
									</li>
									<li>2. 이용자의 상담요청에 대한 종합적이고 적절한 답변을 위하여 상담의사들은 상담 내용과 답변을
										참고할 수 있습니다.</li>
									<li>3. 서비스에서 진행된 상담의 내용은 특정 개인을 식별할 수 없는 형태로 다음과 같은 목적으로
										사용할 수 있습니다.
										<ol>
											<li>Ⅰ. 학술활동</li>
											<li>Ⅱ. 인쇄물, CD-ROM 등의 저작활동</li>
											<li>Ⅲ. FAQ, 추천상담 등의 서비스 내용의 일부</li>
										</ol>
									</li>
									<li>4. 상담에 대한 답변 내용은 각 전문 의사의 의학적 지식을 바탕으로 한 주관적인 답변으로 병원의
										공식적인 의견이 될 수 없으며, 상담내용에 대하여 병원은 일체의 책임을 지지 않습니다.</li>
									<li>5. 다음과 같은 상담신청의 경우에는 상담을 거절할 수 있습니다.
										<ol>
											<li>Ⅰ. 같은 내용의 상담을 반복하여 신청하는 경우</li>
											<li>Ⅱ. 상식에 어긋나는 표현을 사용하여 상담을 신청하는 경우</li>
											<li>Ⅲ. 진단명을 요구하는 상담을 신청하는 경우</li>
											<li>Ⅳ. 치료비, 검사비, 의약품 가격 등에 대하여 상담을 신청하는 경우</li>
										</ol>
									</li>
								</ol>
	
								<h2>제17조 (건강관련정보 제공 서비스)</h2>
								<ol>
									<li>1. 병원에서 제공하는 건강관련정보는 개략적이며 일반적인 것으로서 특정인의 의견에 지나지 않으며
										어떠한 경우에도 전문적인 의학적 진단, 진료, 치료를 대신할 수 없습니다.</li>
									<li>2. 병원은 건강관련정보제공서비스에서 언급된 어떠한 특정한 검사나 제품 또는 치료법을 보증하지
										않습니다.</li>
									<li>3. 병원은 제공하는 건강관련정보는 전적으로 이용자의 판단에 따라 이용되는 것으로서, 병원은
										건강관련정보의 제공과 관련하여 어떠한 책임도 지지 않습니다.</li>
								</ol>
	
								<h2>제18조 (병원과 연결 사이트간의 관계)</h2>
								<p>병원은 연결 사이트가 독자적으로 제공하는 재화, 용역, 서비스에 의하여 이용자와 행하는 거래에 대해서
									어떠한 보증책임을 지지 않습니다.</p>
								<br />
								<h1>제5장 병원 및 이용자의 의무</h1>
	
								<h2>제19조 (병원의 의무)</h2>
								<ol>
									<li>1. 병원은 법령과 본 약관이 금지하거나 공서양속에 반하는 행위를 하지 않으며 본 약관이 정하는
										바에 따라 지속적이고, 안정적으로 서비스를 제공하는 데 최선을 다합니다.</li>
									<li>2. 병원은 이용자의 신용정보를 포함한 개인신상정보의 보안에 대하여 기술적 안전 조치를 강구하고
										관리에 만전을 기함으로써 이용자의 정보보안에 최선을 다합니다.</li>
									<li>3. 병원은 공정하고 건전한 운영과 지속적인 연구·개발을 통하여 양질의 서비스를 제공함으로써
										고객만족을 극대화 하여 인터넷 비즈니스 발전에 기여하도록 합니다.</li>
									<li>4. 병원은 이용자가 원하지 않는 영리목적의 광고성 전자우편을 발송하지 않습니다.</li>
								</ol>
	
								<h2>제20조 (이용자의 주민등록번호 및 비밀번호에 대한 의무)</h2>
								<ol>
									<li>1. 이용자는 병원인터넷 진료를 이용하는 경우 주민등록번호(실명인증) 및 비밀번호를 사용해야
										합니다.</li>
									<li>2. 주민등록번호(실명인증)와 비밀번호에 관한 모든 관리의 책임은 이용자에게 있습니다.</li>
									<li>3. 이용자는 자신의 주민등록번호 및 비밀번호를 제3자에게 이용하게 해서는 안됩니다.</li>
									<li>4. 이용자의 주민등록번호 및 비밀번호의 관리의 부실로 인한 모든 책임은 이용자가 부담합니다.</li>
									<li>5. 이용자는 주민등록번호 및 비밀번호를 도난당하거나 제3자에게 사용되고 있음을 인지한 경우에는
										바로 병원에 통보하고 병원의 안내가 있는 경우에는 그에 따라야 합니다.</li>
								</ol>
	
								<h2>제21조 (이용자의 의무)</h2>
								<ol>
									<li>1. 이용자는 다음의 행위를 하여서는 안됩니다.
										<ol>
											<li>Ⅰ. 신청 또는 변경 시 허위내용의 등록</li>
											<li>Ⅱ. 병원에 게시된 정보의 변경</li>
											<li>Ⅲ. 병원이 정한 정보 이외의 정보(컴퓨터프로그램 등)의 송신 또는 게시</li>
											<li>Ⅳ. 병원 기타 제3자의 저작권 등 지적재산권에 대한 침해</li>
											<li>Ⅴ. 병원 기타 제3자의 명예를 손상시키거나 업무를 방해하는 행위</li>
											<li>Ⅵ. 외설 또는 폭력적인 메시지·화상·음성 기타 공서양속에 반하는 정보를 병원에 공개 또는
												게시하는 행위</li>
											<li>Ⅶ. 다른 이용자에 대한 건강진료 및 상담을 하거나 알선하는 행위</li>
											<li>Ⅷ. 제3자의 진료행위를 선전하는 행위</li>
											<li>Ⅸ. 상품을 판매하거나 판매를 알선하는 행위</li>
											<li>Ⅹ. 기타 부적절하다고 판단하는 행위</li>
										</ol>
									</li>
									<li>2. 전항 각호의 정보 또는 기타 병원이 사이트 운영상 부적절하다고 판단한 정보가 홈페이지에
										게시되거나 사이트와 링크된 곳에 게시된 경우, 병원은 이용자 또는 기타 정보의 게시를 행한 자의 승낙없이
										홈페이지에 게재된 당해 정보를 삭제하거나 링크를 단절할 수 있습니다. 단, 병원은 이러한 정보의 삭제·링크의 절단
										등을 할 의무를 지지 않습니다.</li>
								</ol>
	
								<h1>제6장 기타</h1>
	
								<h2>제22조 (저작권의 귀속 및 이용제한)</h2>
								<ol>
									<li>1. 병원은 작성한 저작물에 대한 저작권 기타 지적재산권은 병원에 귀속합니다.</li>
									<li>2. 이용자는 홈페이지를 이용함으로써 얻은 정보를 병원의 사전 승낙없이 복제, 송신, 출판, 배포,
										방송 기타 방법에 의하여 영리목적으로 이용하거나 제3 자에게 이용하게 하여서는 안됩니다.</li>
								</ol>
	
								<h2>제23조 (분쟁해결)</h2>
								<ol>
									<li>1. 본 이용약관에 규정된 것을 제외하고 발생하는 서비스 이용에 관한 제반 문제에 관한 분쟁은
										최대한 쌍방합의에 의해 해결하도록 합니다.</li>
									<li>2. 이용자가 홈페이지 이용과 관련하여 불만이 있거나 의견을 제시하고자 하는 경우에는 전자우편으로
										홈페이지에 대한 불만사항 또는 의견을 제출하면 됩니다.</li>
									<li>3. 병원은 이용자로부터 제출되는 불만사항 및 의견이 정당하다고 판단하는 경우 우선적으로 그 사항을
										처리합니다. 다만, 신속한 처리가 곤란한 경우에는 이용자에게 그 사유와 처리일정을 즉시 통보해 드립니다.</li>
								</ol>
	
								<h2>제24조 (재판권 및 준거법)</h2>
								<ol>
									<li>1. 병원과 이용자간에 서비스 이용으로 발생한 분쟁에 관한 소송은 민사소송법상의 관할법원으로
										합니다.</li>
									<li>2. 병원과 이용자간에 제기된 소는 민사소송법상 관할을 가지는 대한민국의 법원에 제기합니다.</li>
								</ol>
								<p>본 약관은 2016년 1월 20일부터 적용하고, 2014년 9월 17일부터 적용되던 종전의 약관은 본
									약관으로 대체합니다.</p>
							</div>
				</p>
	
			</DIV>
	
			<div class="input-checkbox-group" style="margin: 10px 0;">
				<label class="input-checkbox input-checkbox-type02"> <input
					type="checkbox" id="chk" name="chk" role="checkbox" /> <i
					aria-hidden="true"></i> <span class="label-text">위 이용 약관에
						동의합니다.</span>
				</label>
			</div>
	
	
			<legend></legend>
			<button class="btn btn-lg btn-primary " onclick="return doc_join(this.form);">
				<span class="button-text">회원 가입</span>
			</button>
			&nbsp;&nbsp;&nbsp;
			<button onclick="back(this.form)" class="btn btn-lg">
				<span class="button-text">취소</span>
			</button>
	
		<div class="image_box">
			<h4 class="image_title">사진 등록</h4>
			<div class="image">
				<!-- onerror="this.style.display='none'" -->
				<img src='#' id="doc_image" alt='' /> 
			</div>
			<div class="file_box">
				<label for="partfile">업로드</label>
				<input type="file" id="partfile" name="partfile" value="파일 첨부" onchange="javascript:readURL(this);">
			</div>
		</div>
		</form>
	</div>
	
	<div class="modal fade" id="successModal" tabindex="-1" role="dialog" aria-hidden="true">
		<div class="vertical-alignment-helper">
			<div class="modal-dialog vertical-align-center">
				<div class="modal-content panel-success">
					<div class="modal-header panel-heading">
						<button type="button" class="close" data-dismiss="modal">
							<span aria-hidden="true">&times;</span>
							<span class="sr-only">Close</span>
						</button>
						<h4 class="modal-title">회원가입 완료</h4>
					</div>
					<div class="modal-body">
						<p class="modal-message">회원가입이 완료되었습니다.</p>
						<p class="modal-message">의료진 코드는 <strong class="doc_code"></strong> 입니다.</p>
					</div>
					<div class="modal-footer">
						<button type="button" class="btn btn-default btn_check" data-dismiss="modal">확인</button>
					</div>
				</div> 
			</div>
		</div>
	</div>
	
</section>

<%@include file="/WEB-INF/views/include/footer.jsp"%>


<script type="text/javascript">
	function email3(emailVal) {

		$('#doc_email').attr("disabled", true);
		if (emailVal == "0") {
			$('#doc_email2').val("");
			$('#doc_email2').attr("disabled", false);
			$('#doc_email2').focus();
		} else {
			$('#doc_email2').val(emailVal);
		}
	}
</script>

<!-- 주소 스크립트 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
	function addrPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {

						var fullAddr = '';
						var extraAddr = '';

						if (data.userSelectedType === 'R') {
							fullAddr = data.roadAddress;

						} else {
							fullAddr = data.jibunAddress;
						}

						if (data.userSelectedType === 'R') {

							if (data.bname !== '') {
								extraAddr += data.bname;
							}

							if (data.buildingName !== '') {
								extraAddr += (extraAddr !== '' ? ', '
										+ data.buildingName : data.buildingName);
							}
							fullAddr += (extraAddr !== '' ? ' (' + extraAddr
									+ ')' : '');
						}

						document.getElementById('doc_addr_number').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('doc_addr1').value = fullAddr;

						document.getElementById('doc_addr2').focus();
					}
				}).open();
	}
</script>

<script>
	function doc_join(frm) {

		$("#doc_phone1 option:selected").val();

		var chk = frm.chk.checked;

		if (frm.doc_name.value == "") {
			alert("이름을 입력하세요.");
			frm.doc_name.focus();
			return false;
		} else if (frm.doc_birth1.value == "" || frm.doc_birth2.value == "") {
			alert("주민번호를 입력하세요.");
			frm.doc_birth1.focus();
			return false;
		} else if (frm.doc_pwd.value == "") {
			alert("비밀번호를 입력하세요.");
			frm.doc_pwd.focus();
			return false;
		} else if (frm.doc_pwd_chk.value == "") {
			alert("비밀번호를 체크하세요.");
			frm.doc_pwd_chk.focus();
			return false;
		} else if (frm.doc_pwd.value != frm.doc_pwd_chk.value) {
			alert("비밀번호가 같지않습니다.");
			return false;
		} else if (frm.doc_phone2.value == "" || frm.doc_phone3.value == "") {
			alert("휴대폰 번호를 입력하세요.");
			frm.doc_phone2.focus();
			return false;
		} else if (frm.doc_email1.value == "" || frm.doc_email2.value == "") {
			alert("이메일를 입력하세요.");
			frm.doc_email1.focus();
			return false;
		} else if (frm.doc_addr_number.value == "" || frm.doc_addr1.value == ""
				|| frm.doc_addr2.value == "") {
			alert("주소를 입력하세요.");
			frm.doc_addr_number.focus();
			frm.doc_addr1.focus();
			return false;
		} else if (frm.depart_field.value == "") {
			alert("진료과를 선택해주세요.");
			frm.depart_field.focus();
			return false;
		} else if (!chk) {
			alert("이용 약관에 동의해 주세요");
			return false;
		}
		
		var field = '';
		$('.chk_box:checked').each(function(index){
			if($('.chk_box:checked').length - 1 == index)
				field += $(this).val();
			else
				field += $(this).val() + ', ';
		});
	
		$('#doc_field').val(field);
		frm.action = "doctorJoin";
		frm.method = "post";
		
		var depart_code = $('#depart_field option:selected').val().substr(0, 2);
		var birth = $('#doc_birth1').val().substr(0, 2);
		var gender = $('#doc_birth2').val().substr(0, 1);
		var rand = Math.floor(Math.random() *(999 - 1)+ 1);
		if((rand+'').length < 3){
			while((rand+'').length < 3) {
				rand = '0' + rand;
			}			
		}
		var doc_code = depart_code + birth + gender + rand;
		$('#doc_code').val(doc_code);
		$('#successModal .btn_check').click(function(){
			frm.submit();
		});
		$('#successModal .doc_code').text(doc_code);
		$('#successModal').modal('show');
		
		return false;
	}
	function back(frm) {
		frm.action = "login";
		frm.method = "post";
	}

	$('#depart_field')
			.change(
					function() { // change 되면 ajax 실행 -> 진료분야 바뀌게함
						var depart_code = $('#depart_field option:selected')
								.attr('value');
						// 선택된거의 code 가져옴
						/* 
						ajax 기본 속성 : 4개 
						type : get, post
						url : 컨트롤러에 매핑된 url
						data : 보낼 데이터
						success : 성공 했을때 */

						// error : 실패했을 때
						var html = '';
						$
								.ajax({
									type : "POST",
									url : "ajaxDepartField",
									data : {
										'depart_code' : depart_code
									},
									success : function(data) { // data에는 진료 분야가 배열로 넘어옴
										for (var i = 0; i < data.length; i++) { // 반복
											html += '<input type=\"checkbox\" name=\"chk_box\" class=\"chk_box\" value=\"' + data[i] + '\">'
													+ data[i];
										}
										$('.field_list').html(html); // 클래스명이 field_list 인곳에 html 태그를 삽입함.
									},
									error : function(request, status, error) {
										alert("code:" + request.status + "\n"
												+ "message:"
												+ request.responseText + "\n"
												+ "error:" + error);
									}
								});
					});
</script>

<script>
	function readURL(input) {
		if(input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$('#doc_image').attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	}
	
	function setDepartField(){
		var depart_code = $('#depart_field option:selected').attr('value');
		var html = '';
		$.ajax({
			type : "POST",
			url : "ajaxDepartField",
			data : {
				'depart_code' : depart_code
			},
			success : function(data) { 
				var outer = $('<div>');
				for (var i = 0; i < data.length; i++) { 
					var div =  $('<div style="margin-top: 5px;">');
					html += '<input type=\"checkbox\" name=\"chk_box\" class=\"chk_box\" style=\"width: 30px;\" value=\"' + data[i] + '\" >'
							+ data[i];
					div.html(html);
					outer.html(div);
				}
				$('.field_list').html(outer); 
			},
			error : function(request, status, error) {
				alert("code:" + request.status + "\n"
						+ "message:"
						+ request.responseText + "\n"
					+ "error:" + error);
			}
		});		
	}
	
	$(document).ready(function(){
		setDepartField();
	});
	
	$('#depart_field').on('change', function(){
		setDepartField();
	});
</script>