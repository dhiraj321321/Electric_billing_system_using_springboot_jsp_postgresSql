<%--
  Created by IntelliJ IDEA.
  User: parid
  Date: 9/20/2025
  Time: 10:15 PM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title} - PowerGrid Pro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>
        body {
            background-color: #f8f9fa;
        }
        .navbar {
            box-shadow: 0 2px 4px rgba(0,0,0,.1);
        }
        .card {
            border: none;
            box-shadow: 0 4px 8px rgba(0,0,0,.1);
            transition: all 0.3s ease;
        }
        .card:hover {
            transform: translateY(-5px);
            box-shadow: 0 8px 16px rgba(0,0,0,.15);
        }
        .hero-section {
            background: url('https://images.unsplash.com/photo-1620714223084-8587df052848?q=80&w=2070') no-repeat center center;
            background-size: cover;
            color: white;
            padding: 6rem 0;
            text-shadow: 2px 2px 4px rgba(0,0,0,0.6);
        }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-light bg-white mb-4">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            <i class="bi bi-lightning-charge-fill text-primary"></i>
            PowerGrid Pro
        </a>
        <div class="collapse navbar-collapse">
            <ul class="navbar-nav ms-auto">
                <security:authorize access="isAuthenticated()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/dashboard">Dashboard</a>
                    </li>
                    <li class="nav-item">
                        <form action="${pageContext.request.contextPath}/logout" method="post">
                            <button type="submit" class="btn btn-outline-danger btn-sm nav-link" style="border:none;">Logout</button>
                        </form>
                    </li>
                </security:authorize>
                <security:authorize access="isAnonymous()">
                    <li class="nav-item">
                        <a class="nav-link" href="${pageContext.request.contextPath}/login">Login</a>
                    </li>
                </security:authorize>
            </ul>
        </div>
    </div>
</nav>

<main class="container"/>