import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure CompartmentModel where
  compartments : Nat
  rates : Matrix (Fin compartments) (Fin compartments) Float
  initialConditions : Vector Float compartments
  solution : Float -> Vector Float compartments
  rateEquationsValid : Prop
  initialConditionsValid : Prop
  solutionSatisfiesODEs : Prop

structure CompartmentModelEvidence (C : CompartmentModel) where
  rateEquationsValidClosed : C.rateEquationsValid
  initialConditionsValidClosed : C.initialConditionsValid
  solutionSatisfiesODEsClosed : C.solutionSatisfiesODEs

def CompartmentModelClosed (C : CompartmentModel) : Prop :=
  C.rateEquationsValid ∧ C.initialConditionsValid ∧ C.solutionSatisfiesODEs

theorem compartment_model_closed_from_evidence (C : CompartmentModel) (E : CompartmentModelEvidence C) :
    CompartmentModelClosed C := by
  exact And.intro E.rateEquationsValidClosed (And.intro E.initialConditionsValidClosed E.solutionSatisfiesODEsClosed)

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse