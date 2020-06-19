// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cuba_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CubaModel _$CubaModelFromJson(Map<String, dynamic> json) {
  return CubaModel()
    ..updated = dateTimeFromJson(json['updated'] as String)
    ..resume = (json['resume'] as List)
        ?.map((e) =>
            e == null ? null : ItemDouble.fromJson(e as Map<String, dynamic>))
        ?.toList()
    ..note = json['note'] as String
    ..mapData = json['map_data'] as Map<String, dynamic>
    ..events = json['events'] as Map<String, dynamic>
    ..casesBySex = json['cases_by_sex'] == null
        ? null
        : CasesBySex.fromJson(json['cases_by_sex'] as Map<String, dynamic>)
    ..casesByModeOfContagion = json['cases_by_mode_of_contagion'] == null
        ? null
        : CasesByModeOfContagion.fromJson(
            json['cases_by_mode_of_contagion'] as Map<String, dynamic>)
    ..evolutionOfCasesByDays = json['evolution_of_cases_by_days'] == null
        ? null
        : EvolutionOfCasesByDays.fromJson(
            json['evolution_of_cases_by_days'] as Map<String, dynamic>)
    ..evolutionOfRecoveredByDays =
        json['evolution_of_recovered_by_days'] == null
            ? null
            : EvolutionOfRecoveredByDays.fromJson(
                json['evolution_of_recovered_by_days'] as Map<String, dynamic>)
    ..evolutionOfDeathsByDays = json['evolution_of_deaths_by_days'] == null
        ? null
        : EvolutionOfDeathsByDays.fromJson(
            json['evolution_of_deaths_by_days'] as Map<String, dynamic>)
    ..distributionOfCases = json['distribution_of_cases'] == null
        ? null
        : DistributionOfCases.fromJson(
            json['distribution_of_cases'] as Map<String, dynamic>)
    ..evolutionOfCasesAndRecoveredByDays =
        json['evolution_of_cases_and_recovered_by_days'] == null
            ? null
            : EvolutionOfCasesAndRecoveredByDays.fromJson(
                json['evolution_of_cases_and_recovered_by_days'] as Map<String, dynamic>)
    ..evolutionOfActiveAndRecoveredAccumulated = json['evolution_of_active_and_recovered_accumulated'] == null ? null : EvolutionOfActiveAndRecoveredAccumulated.fromJson(json['evolution_of_active_and_recovered_accumulated'] as Map<String, dynamic>)
    ..distributionByAgeRanges = (json['distribution_by_age_ranges'] as List)?.map((e) => e == null ? null : ItemCodePlus.fromJson(e as Map<String, dynamic>))?.toList()
    ..casesByNationality = json['cases_by_nationality'] == null ? null : CasesByNationality.fromJson(json['cases_by_nationality'] as Map<String, dynamic>)
    ..distributionByNationalityOfForeignCases = (json['distribution_by_nationality_of_foreign_cases'] as List)?.map((e) => e == null ? null : ItemCode.fromJson(e as Map<String, dynamic>))?.toList()
    ..relationOfTestsPerformed = json['relation_of_tests_performed'] == null ? null : RelationOfTestsPerformed.fromJson(json['relation_of_tests_performed'] as Map<String, dynamic>)
    ..testsByDays = json['tests_by_days'] == null ? null : TestsByDays.fromJson(json['tests_by_days'] as Map<String, dynamic>)
    ..percentPositiveTests = json['percent_positive_tests'] == null ? null : PercentPositiveTests.fromJson(json['percent_positive_tests'] as Map<String, dynamic>)
    ..criticsSeriousEvolution = json['critics_serious_evolution'] == null ? null : CriticsSeriousEvolution.fromJson(json['critics_serious_evolution'] as Map<String, dynamic>)
    ..percentCriticsSeriousToActives = json['percent_critics_serious_to_actives'] == null ? null : PercentCriticsSeriousToActives.fromJson(json['percent_critics_serious_to_actives'] as Map<String, dynamic>)
    ..effectiveReproductiveNumber = json['effective_reproductive_number'] == null ? null : EffectiveReproductiveNumber.fromJson(json['effective_reproductive_number'] as Map<String, dynamic>)
    ..stringencyIndexCuba = json['stringency_index_cuba'] == null ? null : StringencyIndexCubaModel.fromJson(json['stringency_index_cuba'] as Map<String, dynamic>)
    ..affectedProvinces = (json['affected_provinces'] as List)?.map((e) => e == null ? null : ItemProvince.fromJson(e as Map<String, dynamic>))?.toList()
    ..affectedMunicipalities = (json['affected_municipalities'] as List)?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))?.toList()
    ..multipleComparisonOfCubaWithRadar = json['multiple_comparison_of_cuba_with_radar'] == null ? null : MultipleComparisonOfCubaWithRadarModel.fromJson(json['multiple_comparison_of_cuba_with_radar'] as Map<String, dynamic>)
    ..curvesComparison = json['curves_comparison'] == null ? null : CurvesComparisonModel.fromJson(json['curves_comparison'] as Map<String, dynamic>)
    ..testBehaviorComparison = (json['test_behavior_comparison'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k,
          e == null
              ? null
              : TestBehaviorComparison.fromJson(e as Map<String, dynamic>)),
    )
    ..curvesEvolution = json['curves_evolution'] as Map<String, dynamic>
    ..worldCountries = (json['world_countries'] as List)?.map((e) => e == null ? null : ItemExtended.fromJson(e as Map<String, dynamic>))?.toList()
    ..pesquisador = json['pesquisador'] == null ? null : PesquisadorModel.fromJson(json['pesquisador'] as Map<String, dynamic>)
    ..deceasesUpdated = dateTimeFromJson(json['deceases_updated'] as String)
    ..deceasesMapData = json['deceases_map_data'] as Map<String, dynamic>
    ..deceasesEvolutionByDays = json['deceases_evolution_by_days'] == null ? null : EvolutionOfDeathsByDays.fromJson(json['deceases_evolution_by_days'] as Map<String, dynamic>)
    ..deceasesBySex = json['deceases_by_sex'] == null ? null : CasesBySex.fromJson(json['deceases_by_sex'] as Map<String, dynamic>)
    ..deceasesDistributionByAgeRanges = (json['deceases_distribution_by_age_ranges'] as List)?.map((e) => e == null ? null : ItemCodePlus.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesByNationality = json['deceases_by_nationality'] == null ? null : CasesByNationality.fromJson(json['deceases_by_nationality'] as Map<String, dynamic>)
    ..deceasesDistributionAmountDiseaseHistory = (json['deceases_distribution_amount_disease_history'] as Map<String, dynamic>)?.map(
      (k, e) => MapEntry(
          k, e == null ? null : Item.fromJson(e as Map<String, dynamic>)),
    )
    ..deceasesCommonPreviousDiseases = (json['deceases_common_previous_diseases'] as List)?.map((e) => e == null ? null : Item.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesAffectedProvinces = (json['deceases_affected_provinces'] as List)?.map((e) => e == null ? null : ItemProvince.fromJson(e as Map<String, dynamic>))?.toList()
    ..deceasesAffectedMunicipalities = (json['deceases_affected_municipalities'] as List)?.map((e) => e == null ? null : ItemMunicipality.fromJson(e as Map<String, dynamic>))?.toList();
}

Map<String, dynamic> _$CubaModelToJson(CubaModel instance) => <String, dynamic>{
      'updated': dateTimeToJson(instance.updated),
      'resume': instance.resume,
      'note': instance.note,
      'map_data': instance.mapData,
      'events': instance.events,
      'cases_by_sex': instance.casesBySex,
      'cases_by_mode_of_contagion': instance.casesByModeOfContagion,
      'evolution_of_cases_by_days': instance.evolutionOfCasesByDays,
      'evolution_of_recovered_by_days': instance.evolutionOfRecoveredByDays,
      'evolution_of_deaths_by_days': instance.evolutionOfDeathsByDays,
      'distribution_of_cases': instance.distributionOfCases,
      'evolution_of_cases_and_recovered_by_days':
          instance.evolutionOfCasesAndRecoveredByDays,
      'evolution_of_active_and_recovered_accumulated':
          instance.evolutionOfActiveAndRecoveredAccumulated,
      'distribution_by_age_ranges': instance.distributionByAgeRanges,
      'cases_by_nationality': instance.casesByNationality,
      'distribution_by_nationality_of_foreign_cases':
          instance.distributionByNationalityOfForeignCases,
      'relation_of_tests_performed': instance.relationOfTestsPerformed,
      'tests_by_days': instance.testsByDays,
      'percent_positive_tests': instance.percentPositiveTests,
      'critics_serious_evolution': instance.criticsSeriousEvolution,
      'percent_critics_serious_to_actives':
          instance.percentCriticsSeriousToActives,
      'effective_reproductive_number': instance.effectiveReproductiveNumber,
      'stringency_index_cuba': instance.stringencyIndexCuba,
      'affected_provinces': instance.affectedProvinces,
      'affected_municipalities': instance.affectedMunicipalities,
      'multiple_comparison_of_cuba_with_radar':
          instance.multipleComparisonOfCubaWithRadar,
      'curves_comparison': instance.curvesComparison,
      'test_behavior_comparison': instance.testBehaviorComparison,
      'curves_evolution': instance.curvesEvolution,
      'world_countries': instance.worldCountries,
      'pesquisador': instance.pesquisador,
      'deceases_updated': dateTimeToJson(instance.deceasesUpdated),
      'deceases_map_data': instance.deceasesMapData,
      'deceases_evolution_by_days': instance.deceasesEvolutionByDays,
      'deceases_by_sex': instance.deceasesBySex,
      'deceases_distribution_by_age_ranges':
          instance.deceasesDistributionByAgeRanges,
      'deceases_by_nationality': instance.deceasesByNationality,
      'deceases_distribution_amount_disease_history':
          instance.deceasesDistributionAmountDiseaseHistory,
      'deceases_common_previous_diseases':
          instance.deceasesCommonPreviousDiseases,
      'deceases_affected_provinces': instance.deceasesAffectedProvinces,
      'deceases_affected_municipalities':
          instance.deceasesAffectedMunicipalities,
    };
