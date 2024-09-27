<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <div class="wrapper">
        <!-- Sidebar -->

            <div id="sidebar" style="height: 100%;">
                <div class="sidebar-logo">
                    <a href="#">Co</a>
                </div>
                <!-- Sidebar Navigation -->
                 <ul class="sidebar-nav">
                    <li class="sidebar-header">
                        Tools & Component
                    </li>
                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            Profile
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <a href="#" id="navDj" class="sidebar-link">
                            <i class="fa-solid fa-list pe-2"></i>
                            DJ
                        </a>
                    </li>
                    <li class="sidebar-item">
                        <!--  data-bs-target="#pages" : id가 pages인 요소를 타겟으로 설정, ria-controls="pages": id가 pages인 요소를 제어 -->
                        <a href="#" class="sidebar-link collapsed" data-bs-toggle="collapse" data-bs-target="#pages" aria-expanded="false" aria-controls="pages">
                            <i class="fa-regular fa-file-lines pe-2"></i>
                            Pages
                        </a>
                        <!-- data-bs-parent="#sidebar" [부모 요소] id가 sidebar 에 속해있음 -->
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Analytics</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Ecommerces</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">cryoidi</a>
                            </li>
                        </ul>
                    </li>
                 </ul>
            </div>

    </div>
