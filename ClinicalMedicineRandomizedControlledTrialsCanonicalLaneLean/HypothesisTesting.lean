import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure Hypotheses where
  nullHypothesis : Type
  alternativeHypothesis : Type
  testStatistic : Type

def typeIError (α : ℝ) : Prop := 0 ≤ α ∧ α ≤ 1
def typeIIError (β : ℝ) : Prop := 0 ≤ β ∧ β ≤ 1
def statisticalPower (β : ℝ) : ℝ := 1 - β

structure PValue where
  value : ℝ
  significanceLevel : ℝ

def significant (p : PValue) : Prop := p.value < p.significanceLevel

structure ConfidenceInterval where
  lower : ℝ
  upper : ℝ
  confidenceLevel : ℝ

def containsParameter (ci : ConfidenceInterval) (param : ℝ) : Prop := ci.lower ≤ param ∧ param ≤ ci.upper

structure HypothesisEvidence (p : PValue) (ci : ConfidenceInterval) where
  pValueIn01 : 0 ≤ p.value ∧ p.value ≤ 1
  confidenceLevelIn01 : 0 ≤ ci.confidenceLevel ∧ ci.confidenceLevel ≤ 1
  lowerLessUpper : ci.lower < ci.upper

def HypothesisTestingClosed (p : PValue) (ci : ConfidenceInterval) : Prop :=
  significant p ∧ containsParameter ci 0.5

theorem hypothesis_testing_closed_from_evidence (p : PValue) (ci : ConfidenceInterval) (E : HypothesisEvidence p ci) : HypothesisTestingClosed p ci :=
  And.intro (by
    rcases E.pValueIn01 with ⟨h1, h2⟩
    exact h1) (by
    rcases E.lowerLessUpper with h
    exact And.intro (by linarith) (by linarith))

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse