import { SignalData, Asset } from "./Signal";
import SignalWithGale from "./SignalWithGale";
import FilteringSignal from "./FilteringSignal";
import SignalWithoutGale from "./SignalWithoutGale";
import ExtraAnalysisSignal from "./ExtraAnalysisSignal";
import SinaisRicosSignal from "./SinaisRicosSignal";

export default class SignalBuilder {
    static create(signalData: SignalData) {
        switch(signalData.type) {
            case 'withGale':
                return new SignalWithGale(signalData);
            case 'filtering':
                return new FilteringSignal(signalData);
            case 'withoutGale':
                return new SignalWithoutGale(signalData);
            case 'extraAnalysis':
                return new ExtraAnalysisSignal(signalData);
            case 'sinaisRicos':
                return new SinaisRicosSignal(signalData);
            default:
                throw new Error('Invalid signal type');
        }
    }
}