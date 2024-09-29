<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
</head>
<body>
    <div class="container">
        <h1 class="my-4">멜론 DJ 신청하기</h1>
        <hr>
        <ul>
            <li>
                멜론DJ 신청을 하기 위해 DJ플레이리스트를 아래의 항목에 맞춰 만들어야 합니다
                <ul>
                    <li>최소 10곡 이상의 수록곡</li>
                    <li>선곡의 주제/테마/장르를 표현할 수 있는 제목 (단문 X)</li>
                    
                    <li>주제를 설명하는 플레이리스트 상세 소개글 및 2개 이상의 #해시태그 기입</li>
                    <li>동일 아티스트/액봄 곡 20% 또는 3곡 연속 수록 주의</li>
                    <li>마이뮤직>프로필설정>프로필 이미지 등록</li>
                </ul>
            </li>
        </ul>

        <div class="card custom-card">
            <h4>정보 입력</h4>
            <div class="content-wrapper">
                <div class="a">
                    <div class="djTitleImg" >
                     
                    </div>            
                </div>
                <div>
                    <div class="mb-3"> <!-- margin : mb-3-->
                        <label for="djTitle" class="form-label">제목</label>
                        <input type="text" class="form-control" id="djTitle" placeholder="DJ플레이리스트 제목을 입력해주세요" maxlength="40">
                    </div>
                    <div class="mb-3">
                        <label for="themeGenre" class="form-label">테마/장르 선택</label>
                        <select id="form-label" class="form-select">
                            <option value="theme">테마</option>
                            <option value="genre">장르</option>
                        </select>
                    </div>
                    <div class="mb-3">
                        <label for="coverImage" class=form-label>대표 이미지</label>
                        <input type="file" id="coverImage" class="form-control">
                    </div>
                </div>
            </div>
        </div>

        <div class="card custom-card mt-4">
            <h4>선곡하기</h4>
            <div class="row">
                <div class="col-md-6">
                    <caption>플레이리스트</caption>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>플레이리스트명</th>
                                <th>수록곡 수</th>
                                <th>추가</th>
                            </tr>
                        </thead>       
                        <tbody class="song-list">
                            <tr>
                                <td>최근 들은 곡</td>
                                <td>396</td>
                                <td>
                                    <button class="btn btn-primary">추가</button>
                                </td>
                            </tr>
                            <!-- 내 플레이이 리스트에 있는게 보여야함-->
                        </tbody>
                    </table>
                </div>
                
                <div class="col-md-6">
                    <caption>선곡 리스트 (0/1000)</caption>
                    <table class="table table-bordered">
                        <thead>
                            <tr>
                                <th>곡명</th>
                                <th>아티스트</th>
                                <th>앨범</th>
                            </tr>
                        </thead>
                        <tbody id="selectedSongList">
                            <tr>
                                <td colspan="3">곡을 선택해 주세요</td>
                            </tr>
                        </tbody>
                    </table>
                    <button class="btn btn-danger mt-2">삭제</button>
                </div>
            </div> <!--#row-->
        </div>

        <div class="card custom-card mt-4">
            <h4>소개글 입력</h4>
            <div class="mb-3">
                <textarea class="form-control" id="introductionText" rows="5" placeholder="플레이리스트를 설명하는 소개글을 입력해주세요" maxlength="1000"></textarea>
            </div>
            <div class="mb-3">
                <input type="text" class="form-control" placeholder="대표태그를 선택해주세요">
                <small class="form-text text-muted">나의 플레이리스트를 가장 잘 표현해주는 #태그 두 개를 선택해주세요</small>
            </div>
        </div>

        <div class="card custom-card mt-4">
            <h4>멜론DJ 서비스 이용 동의</h4>
            <p>* 멜론DJ 신청을 위해서 먼저 아래 내용에 동의를 해주세요</p>
            <div class="form-check">
                <input class="form-check-input" type="checkbox" id="serciveAgreement">
                <label for="serciveAgreement" class="form-check-label">
                    멜론 DJ 서비스 이용에 동의합니다
                </label>
            </div>
        </div>

        <div class="mt-4 d-flex justify-content-end">
            <button class="btn btn-secondary me-2">미리보기</button>
            <button class="btn btn-success">미리보기</button>
            <button class="btn btn-danger ms-2">미리보기</button>
        </div>
    </div> <!-- div#container-->

    

    
    
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
</body>
</html>