<!-- DataTales Example -->
<div class="card shadow mb-4">
    <div class="card-header py-3">
        <h6 class="m-0 font-weight-bold text-primary">{{@PAGE.title}}</h6>
    </div>
    <div class="card-body">
        {{@MESSAGE | raw}}
        {{@PAGE.content | raw}}
    </div>
</div>