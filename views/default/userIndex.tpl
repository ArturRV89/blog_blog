<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    {foreach from = $allUsers key=$key item=$user name=users}
        <div class="card" style="float: left; display: block;
    max-width: 18rem; max-height: 200px; margin-top: 10px; margin-left: 10px; text-align: center;">
            <div class="card-body">
                <h6 class="card-subtitle mb-2 text-muted">Email : {$user['email']}</h6>
                <h6 class="card-subtitle mb-2 text-muted">Password : {$user['password']}</h6>
                <h6 class="card-subtitle mb-2 text-muted">Created : {$user['created_at']}</h6>
            </div>
        </div>
        {if $smarty.foreach.users.iteration mod 3 == 0}
            <div style="clear: both;"></div>
        {/if}
    {/foreach}

    {include file='../total/footer.tpl'}
</div>
</body>
</html>