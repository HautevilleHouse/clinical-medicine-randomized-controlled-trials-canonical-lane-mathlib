import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure TreatmentEffectEstimate where
  pointEstimate : ℝ
  standardError : ℝ
  confidenceIntervalLower : ℝ
  confidenceIntervalUpper : ℝ
  pValue : ℝ

structure TreatmentEffectEvidence (E : TreatmentEffectEstimate) where
  standardErrorPositive : E.standardError > 0
  confidenceIntervalValid : E.confidenceIntervalLower ≤ E.pointEstimate ∧
    E.pointEstimate ≤ E.confidenceIntervalUpper
  pValueBetweenZeroOne : 0 ≤ E.pValue ∧ E.pValue ≤ 1

def TreatmentEffectEstimationClosed (E : TreatmentEffectEstimate) : Prop :=
  E.standardError > 0 ∧
  E.confidenceIntervalLower ≤ E.pointEstimate ∧
  E.pointEstimate ≤ E.confidenceIntervalUpper ∧
  0 ≤ E.pValue ∧ E.pValue ≤ 1

theorem treatment_effect_estimation_closed_from_evidence
    (E : TreatmentEffectEstimate) (Ev : TreatmentEffectEvidence E) :
    TreatmentEffectEstimationClosed E := by
  exact And.intro Ev.standardErrorPositive
    (And.intro Ev.confidenceIntervalValid Ev.pValueBetweenZeroOne)

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse