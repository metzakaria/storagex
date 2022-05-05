<style>
.dashed-text{
  border-bottom:1px dashed #333;padding:1px 30px 2px 1px;

}
table td{
  font-size:20px;
}


</style>


<table style="width:940px;margin-left: auto;margin-right: auto;" cellspacing="10" cellpadding="8">
<tr>
  <td align="center">
  </td>
  <td align="right"><img src="{{ asset('images/logo.png') }}" width="120"  /></td>
</tr>
<tr>
  <td colspan="2" align="center">
  <strong style="font-size:25px;">StorageX By Kitovu Technology Company</strong><br>
  ( ELECTRONIC WAREHOUSE RECEIPT )
  </td>

</tr>
<tr>
  <td style="height:80px"></td>
  <td></td>
</tr>
<tr>
  <td height="40"><strong>Receipt No.</strong> <span class="dashed-text">{{ $farmerStorage->receipt }}</span></td>
  <td><strong>Date Generated:</strong> <span class="dashed-text">{{ $farmerStorage->date_receipt_generated }}</span></td>
</tr>
<tr>
  <td colspan="2" align="left" height="40"><strong>Warehouse:</strong>  <span class="dashed-text">{{ @$farmerStorage->warehouse->name }}</span></td>
</tr>
<tr>
  <td style="height:40px"></td>
  <td></td>
</tr>
<tr>
  <td colspan="2"><div style="color:#333;border-bottom:4px solid #63946c;padding-bottom:4px;margin-bottom:8px;">Farmer Details</div></td>

</tr>
<tr>
  <td><strong>Name: </strong><span class="dashed-text">{{ $farmerStorage->farmer->full_name }}</span></td>
  <td rowspan="4" align="right">
    @php $img = ($farmerStorage->farmer->photo)?$farmerStorage->farmer->photo:'no_pix.jpg'; @endphp
    <img src="{{ asset('storage/images/farmers/'.$img) }}" width="150" height="150" />
    </td>
</tr>
<tr>
  <td><strong>Address:</strong> <span class="dashed-text">{{ $farmerStorage->farmer->address }}</span></td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>
<tr>
  <td>&nbsp;</td>
</tr>

<tr>
  <td style="height:40px"></td>
  <td></td>
</tr>
<tr>
  <td colspan="2"><div style="color:#333;border-bottom:4px solid #63946c;padding-bottom:4px;margin-bottom:8px;">Produce Information</div></td>

</tr>
<tr>
  <td><strong>Commodity:</strong> <span class="dashed-text">{{ @$farmerStorage->commodity->name }}</span></td>
  <td></td>
</tr>
<tr>
  <td><strong>Quantity:</strong> <span class="dashed-text">{{ $farmerStorage->qty }}Kg</span></td>
  <td></td>
</tr>
<tr>
  <td><strong>Price:</strong> <span class="dashed-text">N{{ number_format($farmerStorage->price,2) }}</span></td>
  <td></td>
</tr>
<tr>
  <td><strong>Value:</strong> <span class="dashed-text">N{{ number_format($farmerStorage->value_amount,2) }}</span></td>
  <td></td>
</tr>
<tr>
  <td style="height:40px"></td>
  <td></td>
</tr>
<tr>
  <td colspan="2" align="right">{!! QrCode::size(100)->generate(url('').'/validateStorage/'.$farmerStorage->id) !!}</td>
</tr>
<tr>
  <td colspan="2" align="left">Issued By: <span class="dashed-text">{{ @$farmerStorage->createdby->full_name }}</span></td>
</tr>
<tr>
  <td style="height:40px"></td>
  <td></td>
</tr>
</table>
