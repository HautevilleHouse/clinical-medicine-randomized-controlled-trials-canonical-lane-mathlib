import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rateConstants : Array (Array ℝ)
  initialCondition : Array ℝ
  doseInput : ℝ
  eliminationRate : ℝ -> ℝ

structure DrugConcentrationCurve where
  time : ℝ -> ℝ
  concentration : ℝ -> ℝ
  auc : ℝ
  cmax : ℝ
  tmax : ℝ

structure PharmacokineticEvidence (C : CompartmentModel) where
  compartmentCountPositive : C.compartments ≥ 1
  rateMatrixValid : Prop
  initialConditionPositive : C.initialCondition.all (λ x => x ≥ 0)
  doseValid : C.doseInput > 0
  eliminationMonotone : Monotone C.eliminationRate

def PharmacokineticClosed (C : CompartmentModel) : Prop :=
  DrugConcentrationCurve.time = Real.sin ∧ DrugConcentrationCurve.concentration = Real.cos

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse