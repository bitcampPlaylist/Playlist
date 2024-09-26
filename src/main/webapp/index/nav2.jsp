<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- nav -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
<link rel="stylesheet" href="../css/nav2.css">
</head>
<body>
    <div class="wrapper">
        <!-- Sidebar -->
         <aside id="sidebar">
            <div class="h-100">
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

                    <li class="sidebar-item">
                        <a href="#" class="sidebar-link collapsed" data-bs-toggle="collapse" data-bs-targ
                        aria-expanded="false" aria-controls="pages">
                            <i class="fa-regular fa-file-lines pe-2"></i>
                            aaaaaaa
                        </a>
                        <ul id="pages" class="sidebar-dropdown list-unstyled collapse" data-bs-parent="#sidebar">
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Analytics</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Ecommerce</a>
                            </li>
                            <li class="sidebar-item">
                                <a href="#" class="sidebar-link">Crypto</a>
                            </li>
                        </ul>
                    </li>
                 </ul>
            </div>
         </aside>
		<!-- Main Component -->
          <div class="main">
          <!-- 
            <nav class="navbar navbar-expand-lg px-3 border-bottom">
                Button for sidebar toggle
                    <button class="btn" type="button" data-bs-theme="dark">
                        <span class="navbar-toggler-icon"></span>
                    </button>
            </nav>
            <main class="content px-3 py-2">
                <div class="container-fluid">
                    <div class="mb-3">
                        <h3>gbootstrap </h3>
                    </div>
                </div>
            </main>
           -->
          </div>
    </div>
    <!-- nav -->
    <script src="https://kit.fontawesome.com/dec34c372f.js" crossorigin="anonymous"></script>
    <script src="../js/nav2.js"></script>
</body>
</html>