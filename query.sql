select h.ratepay_id
	 , s_buyer_delivery.*
from h_buyer h
join s_buyer_delivery s
on h.h_buyer_rk = s.h_buyer_rk
where 'date' between s.valid_from_dttm and s.valid_to_dttm
and h.ratepay_id = 'ratepay_id'


select ht.transaction_id
	 , ls.quantity
	 , ls.net_total_price
	 , ls.gross_total_price
	 , ls.discount
	 , si.description
	 , si.additional_description
	 , si.article_number
	 , si.category
	 , si.tax_rate
	 , si.net_unit_price
	 , si.gross_unit_price
	 , si.unit
from l_transaction_items l
join l_s_transaction_items ls on ls.l_transaction_items_rk = l.l_transaction_items_rk
join h_transactions ht on ht.h_transaction_rk = l.h_transaction_rk
join s_items si on si.h_item_rk = l.h_item_rk
where l.processed_ddtm = (select max(z.processed_ddtm) from l_transaction_items z where z.l_transaction_items_rk = l.l_transaction_items_rk)
and ht.transaction_id = 'transaction_id'
