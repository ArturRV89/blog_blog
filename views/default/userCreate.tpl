<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    <form action="/index.php?controller=user&action=registration" method="post">
        <div class="mb-3">
            <label for="exampleInputEmail1" class="form-label">Email</label>
            <input name="email" type="email" class="form-control" id="newEmail" aria-describedby="emailHelp">
        </div>
        <div class="mb-3">
            <label for="exampleInputPassword1" class="form-label">Password</label>
            <input name="password" type="password" class="form-control" id="newPassword">
        </div>
        <button type="submit" class="btn btn-primary">Register</button>
    </form>

    {include file='../total/footer.tpl'}
</div>
</body>
</html>