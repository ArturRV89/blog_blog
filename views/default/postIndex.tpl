<body>
{include file='../total/header.tpl'}
<div class="container">
    {include file='../total/navigate.tpl'}

    {foreach from = $allPosts key=$key item=$post name=posts}
        <div class="card" style="float: left; display: block;
        max-width: 18rem; margin-top: 10px; margin-left: 10px; text-align: center;">
            <div class="card-body">
                <h5 class="card-title"><span class="text-muted">Title</span> : {$post['title']}</h5>
                <h6 class="card-subtitle mb-2 text-muted">Subtitle : {$post['subtitle']}</h6>
                <h6 class="card-subtitle mb-2 text-muted">Content : {$post['content']}</h6>
                <button class="btn btn-outline-info"><a href="index.php?controller=post&action=show&id={$post['id']}"
                                                class="card-link"">Read more</a></button>
                <button class="btn btn-outline-success"><a href="index.php?controller=post&action=edit&id={$post['id']}"
                                                class="card-link"">Edit</a></button>

            </div>
        </div>
        {if $smarty.foreach.posts.iteration mod 3 == 0}
            <div style="clear: both;"></div>
        {/if}
    {/foreach}

    {include file='../total/footer.tpl'}
</div>
</body>
</html>