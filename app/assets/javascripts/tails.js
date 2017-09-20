$(document).ready(function(){
  $(document).on('change', '#change-batch-status', function(){
    if ($(this).val() != ''){
      $.ajax({
        url: 'show_batch_records',
        method: 'get',
        dataTypa: 'script',
        data: { batch_id: $(this).val() }
      });
    }
  });

  $(document).on('change', '.prduct-list-status', function(){
    var batch_id = $(this).attr('data-batch-id');
    if ($(this).val() != ''){
      $.ajax({
        url: 'filter_batch_records',
        method: 'get',
        dataTypa: 'script',
        data: { batch_id: batch_id, status: $(this).val() }
      });
    }
  });

  $(document).on('change', '#select-all-pids', function(){
    $('input[name="product_ids[]"]').not(this).prop('checked', this.checked);
  });

  $(document).on('click', '.multi-product-action', function(){
    var status = $(this).attr('data-value');
    var batch_id = $(this).attr('data-batch-id');
    if ($('input[name="product_ids[]"]:checked').length == 0){
      alert('please select any product.');
    } else {
      var product_ids = [];
      $('input[name="product_ids[]"]:checked').each(function(){
        product_ids.push($(this).val());
      });
      $.ajax({
        url: 'change_multiple_records',
        method: 'post',
        dataTypa: 'script',
        data: { batch_id: batch_id, status: status, product_ids: product_ids }
      });
    }
  });

  $(document).on('click', '#export-csv-action', function(){
    var status = $('input[name="status"]:checked').val();
    var batch_id = $(this).attr('data-batch-id');
    window.location.href = "/batches/export_csv.xlsx?status="+status+"&batch_id="+batch_id;
  });
});