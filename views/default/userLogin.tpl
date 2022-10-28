<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    <form method="post" action="index.php?controller=user&action=login">
        <div class="mb-3">
            <label for="username" class="form-label">Email</label>
            <input type="text" class="form-control" id="email" name="email">
        </div>
        <div class="mb-3">
            <label for="password" class="form-label">Password</label>
            <input type="password" class="form-control" id="password" name="password">
        </div>
        <div class="mb-3">
            <button type="submit" class="btn btn-primary">Login</button>
        </div>
    </form>

    {include file='../total/footer.tpl'}
</div>
</body>
</html>