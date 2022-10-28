<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container-fluid">
        <a class="navbar-brand" href="#">Blog</a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent"
                aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="index.php?controller=post&action=index">All posts</a>
                </li>

                {if !isset($user)}
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=user&action=create">Registration</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="index.php?controller=user&action=loginpage">Login</a>
                </li>
                {/if}
                {if isset($user)}
                    <li class="nav-item">
                        <a class="nav-link active" aria-current="page" href="index.php?controller=post&action=create">Create post</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?controller=user&action=index">All users</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="index.php?controller=user&action=logout">Logout</a>
                    </li>
                {/if}
            </ul>
            <form class="d-flex" action="index.php?controller=post&action=search" method="post">
                <input class="form-control me-2" type="search" name="query_search" placeholder="Search" aria-label="Search">
                <button class="btn btn-outline-success" type="submit">Search</button>
            </form>
        </div>
    </div>
</nav>