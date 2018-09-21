-- Add F13 to this MV.
-- Name: ofec_totals_pacs_parties_mv_TMP; Type: MATERIALIZED VIEW; Schema: public; Owner: fec

SET search_path = public, pg_catalog;

DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_parties_mv_TMP;

DROP MATERIALIZED VIEW IF EXISTS public.ofec_entity_chart_mv_TMP;

DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_parties_mv_TMP;

DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_mv_TMP;

--
-- 1.Materialized View: public.ofec_totals_pacs_parties_mv_TMP
--

CREATE MATERIALIZED VIEW public.ofec_totals_pacs_parties_mv_TMP AS 
 SELECT oft.sub_id AS idx,
    oft.committee_id,
    oft.committee_name,
    oft.cycle,
    oft.coverage_start_date,
    oft.coverage_end_date,
    oft.all_loans_received,
    oft.allocated_federal_election_levin_share,
    oft.contribution_refunds,
    oft.contributions,
    oft.coordinated_expenditures_by_party_committee,
    oft.disbursements,
    oft.fed_candidate_committee_contributions,
    oft.fed_candidate_contribution_refunds,
    oft.fed_disbursements,
    oft.fed_election_activity,
    oft.fed_receipts,
    oft.independent_expenditures,
    oft.refunded_individual_contributions,
    oft.individual_itemized_contributions,
    oft.individual_unitemized_contributions,
    oft.individual_contributions,
    oft.loan_repayments_other_loans AS loan_repayments_made,
    oft.loan_repayments_other_loans,
    oft.loan_repayments_received,
    oft.loans_made,
    oft.transfers_to_other_authorized_committee,
    oft.net_operating_expenditures,
    oft.non_allocated_fed_election_activity,
    oft.total_transfers,
    oft.offsets_to_operating_expenditures,
    oft.operating_expenditures,
    oft.operating_expenditures AS fed_operating_expenditures,
    oft.other_disbursements,
    oft.other_fed_operating_expenditures,
    oft.other_fed_receipts,
    oft.other_political_committee_contributions,
    oft.refunded_other_political_committee_contributions,
    oft.political_party_committee_contributions,
    oft.refunded_political_party_committee_contributions,
    oft.receipts,
    oft.shared_fed_activity,
    oft.shared_fed_activity_nonfed,
    oft.shared_fed_operating_expenditures,
    oft.shared_nonfed_operating_expenditures,
    oft.transfers_from_affiliated_party,
    oft.transfers_from_nonfed_account,
    oft.transfers_from_nonfed_levin,
    oft.transfers_to_affiliated_committee,
    oft.net_contributions,
    oft.last_report_type_full,
    oft.last_beginning_image_number,
    oft.last_cash_on_hand_end_period,
    oft.cash_on_hand_beginning_period,
    oft.last_debts_owed_by_committee,
    oft.last_debts_owed_to_committee,
    oft.last_report_year,
    oft.committee_type,
    oft.committee_designation,
    oft.committee_type_full,
    oft.committee_designation_full,
    oft.party_full,
    comm_dets.designation
   FROM ofec_totals_combined_mv oft
     JOIN ofec_committee_detail_mv comm_dets USING (committee_id)
  -- WHERE oft.form_type::text = 'F3X'::text
  WHERE oft.form_type IN ('F3X', 'F13')
WITH DATA;

ALTER TABLE public.ofec_totals_pacs_parties_mv_TMP
  OWNER TO fec;
GRANT ALL ON TABLE public.ofec_totals_pacs_parties_mv_TMP TO fec;
GRANT SELECT ON TABLE public.ofec_totals_pacs_parties_mv_TMP TO fec_read;


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_designation_full_i_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_designation_full_id_idx_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_id_idx_idx_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_id COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_full_idx_idx_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_full_idx_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_idx_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (committee_type COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_cycle_idx_idx_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (cycle, idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_designation_idx_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (designation COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_disbursements_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (disbursements);


CREATE UNIQUE INDEX ofec_totals_pacs_parties_mv_tmp_idx_idx_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (idx);


CREATE INDEX ofec_totals_pacs_parties_mv_tmp_receipts_idx1_TMP
  ON public.ofec_totals_pacs_parties_mv_TMP
  USING btree
  (receipts);

  DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_parties_mv CASCADE;

ALTER MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_parties_mv_TMP RENAME TO ofec_totals_pacs_parties_mv;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_designation_full_i_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_designation_full_i_idx1;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_designation_full_id_idx_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_designation_full_id_idx;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_id_idx_idx_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_id_idx_idx;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_full_idx_idx_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_type_full_idx_idx;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_full_idx_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_type_full_idx_idx1;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_committee_type_idx_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_committee_type_idx_idx1;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_cycle_idx_idx_tmp RENAME TO ofec_totals_pacs_parties_mv_cycle_idx_idx;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_designation_idx_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_designation_idx_idx1;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_disbursements_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_disbursements_idx1;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_idx_idx_tmp RENAME TO ofec_totals_pacs_parties_mv_idx_idx;

ALTER INDEX ofec_totals_pacs_parties_mv_tmp_receipts_idx1_tmp RENAME TO ofec_totals_pacs_parties_mv_receipts_idx1;



--
-- 3.Materialized View: public.ofec_totals_parties_mv
--

CREATE MATERIALIZED VIEW public.ofec_totals_parties_mv_TMP AS 
 SELECT pp.idx,
    pp.committee_id,
    pp.committee_name,
    pp.cycle,
    pp.coverage_start_date,
    pp.coverage_end_date,
    pp.all_loans_received,
    pp.allocated_federal_election_levin_share,
    pp.contribution_refunds,
    pp.contributions,
    pp.coordinated_expenditures_by_party_committee,
    pp.disbursements,
    pp.fed_candidate_committee_contributions,
    pp.fed_candidate_contribution_refunds,
    pp.fed_disbursements,
    pp.fed_election_activity,
    pp.fed_receipts,
    pp.independent_expenditures,
    pp.refunded_individual_contributions,
    pp.individual_itemized_contributions,
    pp.individual_unitemized_contributions,
    pp.individual_contributions,
    pp.loan_repayments_made,
    pp.loan_repayments_other_loans,
    pp.loan_repayments_received,
    pp.loans_made,
    pp.transfers_to_other_authorized_committee,
    pp.net_operating_expenditures,
    pp.non_allocated_fed_election_activity,
    pp.total_transfers,
    pp.offsets_to_operating_expenditures,
    pp.operating_expenditures,
    pp.fed_operating_expenditures,
    pp.other_disbursements,
    pp.other_fed_operating_expenditures,
    pp.other_fed_receipts,
    pp.other_political_committee_contributions,
    pp.refunded_other_political_committee_contributions,
    pp.political_party_committee_contributions,
    pp.refunded_political_party_committee_contributions,
    pp.receipts,
    pp.shared_fed_activity,
    pp.shared_fed_activity_nonfed,
    pp.shared_fed_operating_expenditures,
    pp.shared_nonfed_operating_expenditures,
    pp.transfers_from_affiliated_party,
    pp.transfers_from_nonfed_account,
    pp.transfers_from_nonfed_levin,
    pp.transfers_to_affiliated_committee,
    pp.net_contributions,
    pp.last_report_type_full,
    pp.last_beginning_image_number,
    pp.last_cash_on_hand_end_period,
    pp.cash_on_hand_beginning_period,
    pp.last_debts_owed_by_committee,
    pp.last_debts_owed_to_committee,
    pp.last_report_year,
    pp.committee_type,
    pp.committee_designation,
    pp.committee_type_full,
    pp.committee_designation_full,
    pp.party_full,
    pp.designation
   FROM ofec_totals_pacs_parties_mv pp
  WHERE pp.committee_type = 'X'::text OR pp.committee_type = 'Y'::text
WITH DATA;

ALTER TABLE public.ofec_totals_parties_mv_TMP
  OWNER TO fec;
GRANT ALL ON TABLE public.ofec_totals_parties_mv_TMP TO fec;
GRANT SELECT ON TABLE public.ofec_totals_parties_mv_TMP TO fec_read;


CREATE INDEX ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_committee_id_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_id COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_committee_type_full_idx_idx_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_committee_type_full_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_committee_type_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (committee_type COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_cycle_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (cycle, idx);


CREATE INDEX ofec_totals_parties_mv_tmp_designation_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (designation COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_parties_mv_tmp_disbursements_idx_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (disbursements);


CREATE INDEX ofec_totals_parties_mv_tmp_disbursements_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (disbursements);


CREATE UNIQUE INDEX ofec_totals_parties_mv_tmp_idx_idx1_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (idx);


CREATE INDEX ofec_totals_parties_mv_tmp_receipts_idx_TMP
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (receipts);


CREATE INDEX ofec_totals_parties_mv_tmp_receipts_idx1_tmp
  ON public.ofec_totals_parties_mv_TMP
  USING btree
  (receipts);

  DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_parties_mv CASCADE;

ALTER MATERIALIZED VIEW IF EXISTS public.ofec_totals_parties_mv_TMP RENAME TO ofec_totals_parties_mv;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_designation_full_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_id_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_id_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_type_full_idx_idx_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_type_full_idx_idx;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_type_full_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_type_full_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_committee_type_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_committee_type_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_cycle_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_cycle_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_designation_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_designation_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_disbursements_idx_tmp RENAME TO ofec_totals_parties_mv_tmp_disbursements_idx;

ALTER INDEX ofec_totals_parties_mv_tmp_disbursements_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_disbursements_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_receipts_idx_tmp RENAME TO ofec_totals_parties_mv_tmp_receipts_idx;

ALTER INDEX ofec_totals_parties_mv_tmp_idx_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_idx_idx1;

ALTER INDEX ofec_totals_parties_mv_tmp_receipts_idx1_tmp RENAME TO ofec_totals_parties_mv_tmp_receipts_idx1;

--
-- 4. Materialized View: public.ofec_totals_pacs_mv
--

CREATE MATERIALIZED VIEW public.ofec_totals_pacs_mv_TMP AS 
 SELECT ofec_totals_pacs_parties_mv.idx,
    ofec_totals_pacs_parties_mv.committee_id,
    ofec_totals_pacs_parties_mv.committee_name,
    ofec_totals_pacs_parties_mv.cycle,
    ofec_totals_pacs_parties_mv.coverage_start_date,
    ofec_totals_pacs_parties_mv.coverage_end_date,
    ofec_totals_pacs_parties_mv.all_loans_received,
    ofec_totals_pacs_parties_mv.allocated_federal_election_levin_share,
    ofec_totals_pacs_parties_mv.contribution_refunds,
    ofec_totals_pacs_parties_mv.contributions,
    ofec_totals_pacs_parties_mv.coordinated_expenditures_by_party_committee,
    ofec_totals_pacs_parties_mv.disbursements,
    ofec_totals_pacs_parties_mv.fed_candidate_committee_contributions,
    ofec_totals_pacs_parties_mv.fed_candidate_contribution_refunds,
    ofec_totals_pacs_parties_mv.fed_disbursements,
    ofec_totals_pacs_parties_mv.fed_election_activity,
    ofec_totals_pacs_parties_mv.fed_receipts,
    ofec_totals_pacs_parties_mv.independent_expenditures,
    ofec_totals_pacs_parties_mv.refunded_individual_contributions,
    ofec_totals_pacs_parties_mv.individual_itemized_contributions,
    ofec_totals_pacs_parties_mv.individual_unitemized_contributions,
    ofec_totals_pacs_parties_mv.individual_contributions,
    ofec_totals_pacs_parties_mv.loan_repayments_made,
    ofec_totals_pacs_parties_mv.loan_repayments_other_loans,
    ofec_totals_pacs_parties_mv.loan_repayments_received,
    ofec_totals_pacs_parties_mv.loans_made,
    ofec_totals_pacs_parties_mv.transfers_to_other_authorized_committee,
    ofec_totals_pacs_parties_mv.net_operating_expenditures,
    ofec_totals_pacs_parties_mv.non_allocated_fed_election_activity,
    ofec_totals_pacs_parties_mv.total_transfers,
    ofec_totals_pacs_parties_mv.offsets_to_operating_expenditures,
    ofec_totals_pacs_parties_mv.operating_expenditures,
    ofec_totals_pacs_parties_mv.fed_operating_expenditures,
    ofec_totals_pacs_parties_mv.other_disbursements,
    ofec_totals_pacs_parties_mv.other_fed_operating_expenditures,
    ofec_totals_pacs_parties_mv.other_fed_receipts,
    ofec_totals_pacs_parties_mv.other_political_committee_contributions,
    ofec_totals_pacs_parties_mv.refunded_other_political_committee_contributions,
    ofec_totals_pacs_parties_mv.political_party_committee_contributions,
    ofec_totals_pacs_parties_mv.refunded_political_party_committee_contributions,
    ofec_totals_pacs_parties_mv.receipts,
    ofec_totals_pacs_parties_mv.shared_fed_activity,
    ofec_totals_pacs_parties_mv.shared_fed_activity_nonfed,
    ofec_totals_pacs_parties_mv.shared_fed_operating_expenditures,
    ofec_totals_pacs_parties_mv.shared_nonfed_operating_expenditures,
    ofec_totals_pacs_parties_mv.transfers_from_affiliated_party,
    ofec_totals_pacs_parties_mv.transfers_from_nonfed_account,
    ofec_totals_pacs_parties_mv.transfers_from_nonfed_levin,
    ofec_totals_pacs_parties_mv.transfers_to_affiliated_committee,
    ofec_totals_pacs_parties_mv.net_contributions,
    ofec_totals_pacs_parties_mv.last_report_type_full,
    ofec_totals_pacs_parties_mv.last_beginning_image_number,
    ofec_totals_pacs_parties_mv.last_cash_on_hand_end_period,
    ofec_totals_pacs_parties_mv.cash_on_hand_beginning_period,
    ofec_totals_pacs_parties_mv.last_debts_owed_by_committee,
    ofec_totals_pacs_parties_mv.last_debts_owed_to_committee,
    ofec_totals_pacs_parties_mv.last_report_year,
    ofec_totals_pacs_parties_mv.committee_type,
    ofec_totals_pacs_parties_mv.committee_designation,
    ofec_totals_pacs_parties_mv.committee_type_full,
    ofec_totals_pacs_parties_mv.committee_designation_full,
    ofec_totals_pacs_parties_mv.party_full,
    ofec_totals_pacs_parties_mv.designation
   FROM ofec_totals_pacs_parties_mv
  WHERE ofec_totals_pacs_parties_mv.committee_type = 'N'::text OR ofec_totals_pacs_parties_mv.committee_type = 'Q'::text OR ofec_totals_pacs_parties_mv.committee_type = 'O'::text OR ofec_totals_pacs_parties_mv.committee_type = 'V'::text OR ofec_totals_pacs_parties_mv.committee_type = 'W'::text
WITH DATA;

ALTER TABLE public.ofec_totals_pacs_mv_TMP
  OWNER TO fec;
GRANT ALL ON TABLE public.ofec_totals_pacs_mv_TMP TO fec;
GRANT SELECT ON TABLE public.ofec_totals_pacs_mv_TMP TO fec_read;


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_designation_full_idx_idx_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_designation_full_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_designation_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_id_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_id COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_type_full_idx_idx_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_type_full_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_type_full COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_committee_type_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (committee_type COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_cycle_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (cycle, idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_designation_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (designation COLLATE pg_catalog."default", idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_disbursements_idx_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (disbursements);


CREATE INDEX ofec_totals_pacs_mv_tmp_disbursements_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (disbursements);


CREATE UNIQUE INDEX ofec_totals_pacs_mv_tmp_idx_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (idx);


CREATE INDEX ofec_totals_pacs_mv_tmp_receipts_idx_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (receipts);


CREATE INDEX ofec_totals_pacs_mv_tmp_receipts_idx1_TMP
  ON public.ofec_totals_pacs_mv_TMP
  USING btree
  (receipts);

  DROP MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_mv CASCADE;

  ALTER MATERIALIZED VIEW IF EXISTS public.ofec_totals_pacs_mv_TMP RENAME TO ofec_totals_pacs_mv;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_designation_full_idx_idx_tmp RENAME TO ofec_totals_pac_mv_tmp_committee_designation_full_idx_idx;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_designation_full_idx_idx1_tmp RENAME TO ofec_totals_pac_mv_tmp_committee_designation_full_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_id_idx_idx1_tmp RENAME TO ofec_totals_pac_mv_tmp_committee_id_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_type_full_idx_idx_tmp RENAME TO ofec_totals_pac_mv_tmp_committee_type_full_idx_idx;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_type_full_idx_idx1_tmp RENAME TO ofec_totals_pac_mv_tmp_committee_type_full_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_committee_type_idx_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_committee_type_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_cycle_idx_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_cycle_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_designation_idx_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_designation_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_disbursements_idx_tmp RENAME TO ofec_totals_pacs_mv_tmp_disbursements_idx;

ALTER INDEX ofec_totals_pacs_mv_tmp_disbursements_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_disbursements_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_idx_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_idx_idx1;

ALTER INDEX ofec_totals_pacs_mv_tmp_receipts_idx_tmp RENAME TO ofec_totals_pacs_mv_tmp_receipts_idx;

ALTER INDEX ofec_totals_pacs_mv_tmp_receipts_idx1_tmp RENAME TO ofec_totals_pacs_mv_tmp_receipts_idx1;


--
-- 2. Materialized View: public.ofec_entity_chart_mv
--

CREATE MATERIALIZED VIEW public.ofec_entity_chart_mv_TMP AS 
 WITH cand_totals AS (
         SELECT 'candidate'::text AS type,
            date_part('month'::text, ofec_totals_house_senate_mv.coverage_end_date) AS month,
            date_part('year'::text, ofec_totals_house_senate_mv.coverage_end_date) AS year,
            sum(COALESCE(ofec_totals_house_senate_mv.receipts, 0::numeric) - (COALESCE(ofec_totals_house_senate_mv.political_party_committee_contributions, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.other_political_committee_contributions, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.offsets_to_operating_expenditures, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.loan_repayments, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.contribution_refunds, 0::numeric))) AS candidate_adjusted_total_receipts,
            sum(COALESCE(ofec_totals_house_senate_mv.disbursements, 0::numeric) - (COALESCE(ofec_totals_house_senate_mv.transfers_to_other_authorized_committee, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.loan_repayments, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.contribution_refunds, 0::numeric) + COALESCE(ofec_totals_house_senate_mv.other_disbursements, 0::numeric))) AS candidate_adjusted_total_disbursements
           FROM ofec_totals_house_senate_mv
          WHERE ofec_totals_house_senate_mv.cycle >= 2008
          GROUP BY (date_part('month'::text, ofec_totals_house_senate_mv.coverage_end_date)), (date_part('year'::text, ofec_totals_house_senate_mv.coverage_end_date))
        ), pac_totals AS (
         SELECT 'pac'::text AS type,
            date_part('month'::text, ofec_totals_pacs_mv.coverage_end_date) AS month,
            date_part('year'::text, ofec_totals_pacs_mv.coverage_end_date) AS year,
            sum(COALESCE(ofec_totals_pacs_mv.receipts, 0::numeric) - (COALESCE(ofec_totals_pacs_mv.political_party_committee_contributions, 0::numeric) + COALESCE(ofec_totals_pacs_mv.other_political_committee_contributions, 0::numeric) + COALESCE(ofec_totals_pacs_mv.offsets_to_operating_expenditures, 0::numeric) + COALESCE(ofec_totals_pacs_mv.fed_candidate_contribution_refunds, 0::numeric) + COALESCE(ofec_totals_pacs_mv.transfers_from_nonfed_account, 0::numeric) + COALESCE(ofec_totals_pacs_mv.loan_repayments_other_loans, 0::numeric) + COALESCE(ofec_totals_pacs_mv.contribution_refunds, 0::numeric))) AS pac_adjusted_total_receipts,
            sum(COALESCE(ofec_totals_pacs_mv.disbursements, 0::numeric) - (COALESCE(ofec_totals_pacs_mv.shared_nonfed_operating_expenditures, 0::numeric) + COALESCE(ofec_totals_pacs_mv.transfers_to_affiliated_committee, 0::numeric) + COALESCE(ofec_totals_pacs_mv.fed_candidate_committee_contributions, 0::numeric) + COALESCE(ofec_totals_pacs_mv.loan_repayments_other_loans, 0::numeric) + COALESCE(ofec_totals_pacs_mv.contribution_refunds, 0::numeric) + COALESCE(ofec_totals_pacs_mv.other_disbursements, 0::numeric))) AS pac_adjusted_total_disbursements
           FROM ofec_totals_pacs_mv
          WHERE (ofec_totals_pacs_mv.committee_type = ANY (ARRAY['N'::text, 'Q'::text, 'O'::text, 'V'::text, 'W'::text])) AND ofec_totals_pacs_mv.designation::text <> 'J'::text AND ofec_totals_pacs_mv.cycle >= 2008
          GROUP BY (date_part('month'::text, ofec_totals_pacs_mv.coverage_end_date)), (date_part('year'::text, ofec_totals_pacs_mv.coverage_end_date))
        ), party_totals AS (
         SELECT 'party'::text AS type,
            date_part('month'::text, ofec_totals_parties_mv.coverage_end_date) AS month,
            date_part('year'::text, ofec_totals_parties_mv.coverage_end_date) AS year,
            sum(COALESCE(ofec_totals_parties_mv.receipts, 0::numeric) - (COALESCE(ofec_totals_parties_mv.political_party_committee_contributions, 0::numeric) + COALESCE(ofec_totals_parties_mv.other_political_committee_contributions, 0::numeric) + COALESCE(ofec_totals_parties_mv.offsets_to_operating_expenditures, 0::numeric) + COALESCE(ofec_totals_parties_mv.fed_candidate_contribution_refunds, 0::numeric) + COALESCE(ofec_totals_parties_mv.transfers_from_nonfed_account, 0::numeric) + COALESCE(ofec_totals_parties_mv.loan_repayments_other_loans, 0::numeric) + COALESCE(ofec_totals_parties_mv.contribution_refunds, 0::numeric))) AS party_adjusted_total_receipts,
            sum(COALESCE(ofec_totals_parties_mv.disbursements, 0::numeric) - (COALESCE(ofec_totals_parties_mv.shared_nonfed_operating_expenditures, 0::numeric) + COALESCE(ofec_totals_parties_mv.transfers_to_other_authorized_committee, 0::numeric) + COALESCE(ofec_totals_parties_mv.fed_candidate_committee_contributions, 0::numeric) + COALESCE(ofec_totals_parties_mv.loan_repayments_other_loans, 0::numeric) + COALESCE(ofec_totals_parties_mv.contribution_refunds, 0::numeric) + COALESCE(ofec_totals_parties_mv.other_disbursements, 0::numeric))) AS party_adjusted_total_disbursements
           FROM ofec_totals_parties_mv
          WHERE (ofec_totals_parties_mv.committee_type = ANY (ARRAY['X'::text, 'Y'::text])) AND ofec_totals_parties_mv.designation::text <> 'J'::text AND (ofec_totals_parties_mv.committee_id::text <> ALL (ARRAY['C00578419'::character varying, 'C00485110'::character varying, 'C00422048'::character varying, 'C00567057'::character varying, 'C00483586'::character varying, 'C00431791'::character varying, 'C00571133'::character varying, 'C00500405'::character varying, 'C00435560'::character varying, 'C00572958'::character varying, 'C00493254'::character varying, 'C00496570'::character varying, 'C00431593'::character varying]::text[])) AND ofec_totals_parties_mv.cycle >= 2008
          GROUP BY (date_part('month'::text, ofec_totals_parties_mv.coverage_end_date)), (date_part('year'::text, ofec_totals_parties_mv.coverage_end_date))
        ), combined AS (
         SELECT month,
            year,
            year::numeric + year::numeric % 2::numeric AS cycle,
                CASE
                    WHEN max(cand_totals.candidate_adjusted_total_receipts) IS NULL THEN 0::numeric
                    ELSE max(cand_totals.candidate_adjusted_total_receipts)
                END AS candidate_receipts,
                CASE
                    WHEN max(cand_totals.candidate_adjusted_total_disbursements) IS NULL THEN 0::numeric
                    ELSE max(cand_totals.candidate_adjusted_total_disbursements)
                END AS canidate_disbursements,
                CASE
                    WHEN max(pac_totals.pac_adjusted_total_receipts) IS NULL THEN 0::numeric
                    ELSE max(pac_totals.pac_adjusted_total_receipts)
                END AS pac_receipts,
                CASE
                    WHEN max(pac_totals.pac_adjusted_total_disbursements) IS NULL THEN 0::numeric
                    ELSE max(pac_totals.pac_adjusted_total_disbursements)
                END AS pac_disbursements,
                CASE
                    WHEN max(party_totals.party_adjusted_total_receipts) IS NULL THEN 0::numeric
                    ELSE max(party_totals.party_adjusted_total_receipts)
                END AS party_receipts,
                CASE
                    WHEN max(party_totals.party_adjusted_total_disbursements) IS NULL THEN 0::numeric
                    ELSE max(party_totals.party_adjusted_total_disbursements)
                END AS party_disbursements
           FROM cand_totals
             FULL JOIN pac_totals USING (month, year)
             FULL JOIN party_totals USING (month, year)
          GROUP BY month, year
          ORDER BY year, month
        )
 SELECT row_number() OVER () AS idx,
    combined.month,
    combined.year,
    combined.cycle,
    last_day_of_month(make_timestamp(combined.year::integer, combined.month::integer, 1, 0, 0, 0.0::double precision)) AS date,
    sum(combined.candidate_receipts) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_candidate_receipts,
    combined.candidate_receipts,
    sum(combined.canidate_disbursements) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_candidate_disbursements,
    combined.canidate_disbursements,
    sum(combined.pac_receipts) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_pac_receipts,
    combined.pac_receipts,
    sum(combined.pac_disbursements) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_pac_disbursements,
    combined.pac_disbursements,
    sum(combined.party_receipts) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_party_receipts,
    combined.party_receipts,
    sum(combined.party_disbursements) OVER (PARTITION BY combined.cycle ORDER BY combined.year, combined.month) AS cumulative_party_disbursements,
    combined.party_disbursements
   FROM combined
  WHERE combined.cycle >= 2008::numeric
WITH DATA;

ALTER TABLE public.ofec_entity_chart_mv_TMP
  OWNER TO fec;
GRANT ALL ON TABLE public.ofec_entity_chart_mv_TMP TO fec;
GRANT SELECT ON TABLE public.ofec_entity_chart_mv_TMP TO fec_read;


CREATE INDEX ofec_entity_chart_mv_tmp_cycle_idx1_TMP
  ON public.ofec_entity_chart_mv_TMP
  USING btree
  (cycle);


CREATE UNIQUE INDEX ofec_entity_chart_mv_tmp_idx_idx1_TMP
  ON public.ofec_entity_chart_mv_TMP
  USING btree
  (idx);

  DROP MATERIALIZED VIEW IF EXISTS public.ofec_entity_chart_mv CASCADE;

ALTER MATERIALIZED VIEW IF EXISTS public.ofec_entity_chart_mv_TMP RENAME TO ofec_entity_chart_mv;

ALTER INDEX ofec_entity_chart_mv_tmp_cycle_idx1_tmp RENAME TO ofec_entity_chart_mv_tmp_cycle_idx1;

ALTER INDEX ofec_entity_chart_mv_tmp_idx_idx1_tmp RENAME TO ofec_entity_chart_mv_tmp_idx_idx1;





















