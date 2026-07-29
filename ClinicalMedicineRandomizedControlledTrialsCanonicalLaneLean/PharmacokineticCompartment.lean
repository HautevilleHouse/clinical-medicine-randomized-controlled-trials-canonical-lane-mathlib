import canonicalLaneMathlib.AdmissibleClass

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

structure PharmacokineticCompartmentModel where
  compartmentCount : Nat
  absorptionRate : Float
  eliminationRate : Float
  volumeDistribution : Float
  linearDynamics : Prop
  steadyStateConcentration : Float
  doseResponseCurve : Float -> Float

structure PharmacokineticCompartmentEvidence (P : PharmacokineticCompartmentModel) where
  linearDynamicsClosed : P.linearDynamics
  steadyStateConcentrationClosed : P.steadyStateConcentration > 0
  doseResponseMonotonic : ∀ x y, x ≤ y → P.doseResponseCurve x ≤ P.doseResponseCurve y

def PharmacokineticCompartmentClosed (P : PharmacokineticCompartmentModel) : Prop :=
  P.linearDynamics ∧ P.steadyStateConcentration > 0

theorem pharmacokinetic_compartment_closed_from_evidence
    (P : PharmacokineticCompartmentModel) (E : PharmacokineticCompartmentEvidence P) :
    PharmacokineticCompartmentClosed P := by
  exact And.intro E.linearDynamicsClosed E.steadyStateConcentrationClosed

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse
