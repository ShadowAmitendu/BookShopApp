<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>${param.title != null ? param.title : 'BookShelf - Your Online Bookstore'}</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link href="https://fonts.googleapis.com/css2?family=Space+Grotesk:wght@400;700&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        body {
            font-family: 'Space Grotesk', sans-serif;
        }

        .flat-shadow {
            box-shadow: 8px 8px 0px 0px rgba(0, 0, 0, 1);
        }

        .flat-shadow-hover:hover {
            box-shadow: 12px 12px 0px 0px rgba(0, 0, 0, 1);
            transform: translate(-2px, -2px);
        }

        .flat-shadow-sm {
            box-shadow: 4px 4px 0px 0px rgba(0, 0, 0, 1);
        }
    </style>
</head>
<body class="min-h-screen flex flex-col bg-[#F3F4F6]">

