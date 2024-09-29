<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

    <div class="container">
        <h2 class="my-4">DJ 플레이리스트 정보</h2>
        <div class="card custom-card">
            <div class="content-wrapper">
                <div class="a">
                    <div class="djTitleImg" >
                     a  
                    </div>            
                </div>
                <div>
                    <div class="mb-3"> <!-- margin : mb-3-->
                        <h3 for="djTitle" class="form-label">DJ playList 제목(HOT TRENDY: K-POP 신곡)</h3>
                        <p>DJ아이디(K-POP마스터)</p>
                        <p>등록일(2024.02.12)</p>
                    </div>
                    <div class="mb-3">
                        <a href="#" class="badge text-bg-secondary  rounded-pill djTag">#휴식</a>
                        <a href="#" class="badge text-bg-secondary rounded-pill djTag">#발라드</a>
                    </div>
                    <div class="mb-3">
                        <i class="fa-regular fa-heart" style="color: rgb(85, 85, 85);"></i>
                        <span>615</span> <span style="font-size: 10px;">| 200곡</span>
                    </div>
                </div>
            </div>
        </div>


        <div class="card custom-card mt-4">
            <h4>소개글</h4>
            <div class="mb-3">
                <p>도입부 부터 너무 좋은 KPOP 플레이리스트 (노동요 매장음악 노래모음)
                    유튜브에 쉐어룸을 검색해보세요^^
                    (textarea부분을 가져올곳)</p>
                <p>#KPOP #드라이브 #쉐어룸 #매장음악 #노동요 #노래모음 #카페음악 #운동 #헬스 #신나는음악  (나의 플레이리스트를 가장 잘 표현해주는 해시태드)</p>
            </div>
        </div>
        
        <div class="card custom-card mt-4 table_section">
            <div class="table_header">
                <p>수록곡</p>
                <button class="btn add_new">담기</button>
            </div>
            <table>
                <thead>
                    <tr>
                        <th>
                            <input type="checkbox" class="checkbox_all">
                        </th>
                        <th>번호</th>
                        <th>앨범사진</th>
                        <th>곡정보</th>
                        <th>앨범</th>
                    </tr>
                </thead>
                <tbody>  
                    <tr>
                        <td>
                            <input type="checkbox" class="checkbox_item">
                        </td>
                        <td>1</td>
                        <td>
                            <img src="../img/rose.jpg" alt="">
                        </td>
                        <td>Hype Boy</td>
                        <td>NewJeans 1st EP'New Je...</td>
                    </tr>
                        <td>
                            <input type="checkbox"class="checkbox_item">
                        </td>
                        <td>1</td>
                        <td>
                            <img src="../img/rose.jpg" alt="">
                        </td>
                        <td>Hype Boy</td>
                        <td>NewJeans 1st EP'New Je...</td>
                    </tr>
                        <td>
                            <input type="checkbox"class="checkbox_item">
                        </td>
                        <td>1</td>
                        <td>
                            <img src="../img/rose.jpg" alt="">
                        </td>
                        <td>Hype Boy</td>
                        <td>NewJeans 1st EP'New Je...</td>
                    </tr>
                        <td>
                            <input type="checkbox" class="checkbox_item">
                        </td>
                        <td>1</td>
                        <td>
                            <img src="../img/rose.jpg" alt="">
                        </td>
                        <td>Hype Boy</td>
                        <td>NewJeans 1st EP'New Je...</td>
                    </tr>

                </tbody>
            </table>
        </div>

        <!-- paging -->
         <div class="pagination">
            <div><i class="fa-solid fa-chevron-left"></i></div>
            <div>1</div>
            <div>2</div>
            <div>3</div>
            <div><i class="fa-solid fa-chevron-right"></i></div>
         </div>
    </div>






<!-- script -->


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">

</body>
</html>