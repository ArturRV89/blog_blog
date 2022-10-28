<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    {foreach from=$onePost key=id item=val name="post"}
        <div class="card" style="width: 18rem; height:200px; margin-top: 10px; display: block; text-align: center;">
            <div class="card-body">
                <h5 class="card-title" {$id}>{$val['title']}</h5>
                <h6 class="card-subtitle mb-2 text-muted" {$id}>{$val['subtitle']}</h6>
                <p class="card-text" {$id}>{$val['content']}</p>
                <button class="btn btn-outline-info"><a href="index.php?controller=post&action=index" class="card-link"">General page</a></button>
            </div>
        </div>
    {/foreach}

    {include file='../total/footer.tpl'}
</div>
</body>
</html>