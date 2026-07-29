import canonicalLaneMathlib.AdmissibleClass
import ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean.BridgeLemmas

namespace HautevilleHouse
namespace ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean

def ConstrainedRCTClosure (A : AdmissibleClass) : Prop :=
  bridgeClosed A ∧ gateClosed A

theorem constrained_rct_endgame (A : AdmissibleClass) :
    ConstrainedRCTClosure A := by
  exact And.intro (bridge_from_admissible_class A) (gate_from_admissible_class A)

end ClinicalMedicineRandomizedControlledTrialsCanonicalLaneLean
end HautevilleHouse